import argparse
import sys

from collections import defaultdict
from pathlib import Path

from d64 import DiskImage
from d64.d71_image import D71Image
from d64.d81_image import D81Image
from d64.block import Block
from d64.side_sector import SideSector


IMAGE = None
FIX = False
YES = False
VERBOSE = False
QUIET = False

USED_BLOCKS = defaultdict(set)


class CheckAborted(KeyboardInterrupt):
    pass


def remember_used(track, sector):
    """Note block usage for later reconciliation."""
    global USED_BLOCKS

    USED_BLOCKS[track].add(sector)


def fix_error(text, fixer=None, **kwargs):
    """Report, and optionally repair, an error."""
    print("ERROR: "+text)
    if FIX and fixer:
        if YES:
            return fixer(**kwargs)
        response = input("Fix? ")
        if response.lower() in ('q', 'quit'):
            raise CheckAborted
        if response.lower() in ('y', 'yes'):
            return fixer(**kwargs)
    return 1


def check_misc():
    """Check various DOS fields and report disk name & id."""
    errors = 0

    if not QUIET:
        print("\nChecking DOS information...")
    if IMAGE.dos_version != IMAGE.DOS_VERSION:
        msg = "Unknown DOS version, "+chr(IMAGE.dos_version)
        errors += fix_error(msg, fix_dos_version)
    elif VERBOSE:
        print("DOS version: "+chr(IMAGE.dos_version))

    if IMAGE.dos_type != IMAGE.DOS_FORMAT:
        msg = "Invalid DOS format, ${:02x}".format(IMAGE.dos_type)
        errors += fix_error(msg, fix_dos_types)
    elif VERBOSE:
        print("DOS format: "+chr(IMAGE.dos_type))

    block = Block(IMAGE, IMAGE.DIR_TRACK, 0)
    bad_link = True
    if not block.is_final:
        try:
            next = block.next_block()
            if next.track == IMAGE.DIR_TRACK and next.sector == IMAGE.DIR_SECTOR:
                bad_link = False
        except ValueError:
            # invalid track/sector
            pass
    if bad_link:
        ts = block.get(0, 2)
        msg = "Invalid link to directory block, {:d}:{:d}".format(*ts)
        errors += fix_error(msg, fix_dir_link)
    elif VERBOSE:
        print("Link to directory block OK, {!s}".format(next))

    if not QUIET:
        print("Disk name: {}   Disk id: {}".format(IMAGE.name.decode(), IMAGE.id.decode()))
    if errors == 0 and not QUIET:
        print("OK")

    return errors


def check_bam():
    """Check Block Availability Map."""
    errors = 0

    if not QUIET:
        print("\nChecking Block Availability Map...")
    for track in range(1, IMAGE.MAX_TRACK+1):
        total, bits = IMAGE.bam.get_entry(track)
        counted = bits.count('1')
        if total != counted:
            msg = "Mismatch in track {:d} total and bits, {:d} & {:d} ({})".format(track, total, counted, bits)
            errors += fix_error(msg, fix_bam_entry, track=track)
        if VERBOSE:
            print("Track: {:2d}   Free blocks: {:2d}   Free bits: {}".format(track, total, bits))

    if not IMAGE.bam.is_allocated(IMAGE.DIR_TRACK, 0):
        msg = "Track {:d}:0 not allocated".format(IMAGE.DIR_TRACK)
        errors += fix_error(msg, fix_unalloc_block, block=Block(IMAGE, IMAGE.DIR_TRACK, 0))
    elif VERBOSE:
        print("Block {:d}:0 allocated".format(IMAGE.DIR_TRACK))
    remember_used(IMAGE.DIR_TRACK, 0)

    extra_track = None
    if isinstance(IMAGE, D71Image):
        # all of track 53 should be marked as allocated
        extra_track = IMAGE.EXTRA_BAM_TRACK
        extra_sectors = range(0, IMAGE.max_sectors(IMAGE.EXTRA_BAM_TRACK))
    elif isinstance(IMAGE, D81Image):
        # BAM sectors 1 and 2 should be marked as allocated
        extra_track = IMAGE.DIR_TRACK
        extra_sectors = range(1, 3)

    if extra_track is not None:
        for sector in extra_sectors:
            if not IMAGE.bam.is_allocated(extra_track, sector):
                msg = "Track {:d}:{:d} not allocated".format(extra_track, sector)
                errors += fix_error(msg, fix_unalloc_block, block=Block(IMAGE, extra_track, sector))
            elif VERBOSE:
                print("Block {:d}:{:d} allocated".format(extra_track, sector))
            remember_used(extra_track, sector)

    if errors == 0 and not QUIET:
        print("OK")

    return errors


def check_dir_links():
    """Check the chain of blocks in the directory."""
    errors = 0
    block = Block(IMAGE, IMAGE.DIR_TRACK, IMAGE.DIR_SECTOR)

    while True:
        if not IMAGE.bam.is_allocated(block.track, block.sector):
            msg = "Block {!s} not allocated".format(block)
            errors += fix_error(msg, fix_unalloc_block, block=block)
        elif VERBOSE:
            print("Block {!s} allocated".format(block))
        remember_used(block.track, block.sector)
        if block.is_final:
            if block.data_size != 0xfe:
                msg = "Block {!s} has invalid data size, {:d}".format(block, block.data_size)
                errors += fix_error(msg, fix_data_size, block=block, size=0xfe)
            elif VERBOSE:
                print("Block {!s} checked".format(block))
            # end of chain
            break
        if VERBOSE:
            print("Block {!s} checked".format(block))
        try:
            next_block = block.next_block()
            if next_block.sector in USED_BLOCKS[next_block.track]:
                msg = "Block {!s} links to previous directory block {!s}".format(block, next_block)
                # truncate directory chain
                errors += fix_error(msg, fix_data_size, block=block, size=0xfe)
                break
            block = next_block
        except ValueError:
            ts = block.get(0, 2)
            msg = "Block {!s} has invalid link, {:d}:{:d}".format(block, *ts)
            # truncate directory chain
            errors += fix_error(msg, fix_data_size, block=block, size=0xfe)
            break

    return errors


def check_directory():
    """Check directory integrity."""

    if not QUIET:
        print("\nChecking directory...")
    # first check the integrity of the linked directory blocks
    errors = check_dir_links()

    # next check the basic integrity of each directory entry
    entry = 1
    for path in IMAGE.iterdir():
        raw_ftype = path.entry._file_type()
        if raw_ftype & 7 > path.entry.max_file_type():
            msg = "Entry {:2d}, invalid file type, ${:02x}".format(entry, raw_ftype)
            errors += fix_error(msg, fix_ftype, entry=path.entry, ftype='PRG')
        elif VERBOSE:
            print("Entry {:2d} has valid file type, ${:02x} ({})".format(entry, raw_ftype, path.entry.file_type))

        try:
            first_block = path.entry.first_block()
            if VERBOSE:
                print("Entry {:2d}, link to first block OK, {!s}".format(entry, first_block))
        except ValueError:
            # invalid track/sector
            ts = path.entry.start_ts
            msg = "Entry {:2d}, invalid link to first data block, {:d}:{:d}".format(entry, *ts)
            # missing file contents, delete the entry
            errors += fix_error(msg, fix_ftype, entry=path.entry, ftype=0)

        ss_track, ss_sector = path.entry.side_sector_ts
        if path.entry.file_type == 'REL':
            if path.entry.record_len == 0:
                msg = "Entry {:2d}, invalid relative file record length, {:d}".format(entry, path.entry.record_len)
                # missing relative file info, delete the entry
                errors += fix_error(msg, fix_ftype, entry=path.entry, ftype=0)
            elif VERBOSE:
                print("Entry {:2d}, relative file record length {:d}".format(entry, path.entry.record_len))
        elif path.entry.record_len or ss_track or ss_sector:
            msg = "Entry {:2d}, spurious relative file data, {:d}:{:d} {:d}".format(entry, ss_track, ss_sector, path.entry.record_len)
            errors += fix_error(msg, fix_rel_data, entry=path.entry)
        entry += 1

    if errors == 0 and not QUIET:
        print("OK")

    return errors


def check_side_sectors(path, file_blocks):
    """Check the integrity of side sectors of a relative file."""
    errors = 0
    sector_count = 0
    all_side_sectors = []

    if VERBOSE:
        print("Checking side sectors of relative file {!s}".format(path.name))
    # first check the integrity of the linked side sectors
    rebuild = False
    try:
        side_sector = SideSector(IMAGE, *path.entry.side_sector_ts)
    except ValueError:
        ss_track, ss_sector = path.entry.side_sector_ts
        print("File {!s}, invalid link to side sector, {:d}:{:d}".format(path.name, ss_track, ss_sector))
        rebuild = True
    if not rebuild and side_sector.sector in USED_BLOCKS[side_sector.track]:
        print("File {!s}, first side sector {!s} is in use".format(path.name, side_sector))
        rebuild = True

    while not rebuild and side_sector:
        # this file block usage
        all_side_sectors.append(side_sector)

        try:
            next_ss = side_sector.next_block()
        except ValueError:
            # invalid track/sector
            ts = side_sector.get(0, 2)
            print("Side sector {:d}, invalid link to side sector, {:d}:{:d}".format(sector_count, *ts))
            rebuild = True
            break
        if next_ss:
            if next_ss in all_side_sectors:
                print("Side sector {:d}, links to previous side sector {!s}".format(sector_count, next_ss))
                rebuild = True
                break
            if next_ss.sector in USED_BLOCKS[next_ss.track]:
                print("Side sector {:d}, links to in use block {!s}".format(sector_count, next_ss))
                rebuild = True
                break
            if sector_count+1 == SideSector.MAX_SIDE_SECTORS:
                print("Side sector count exceeds maximum ({:d})".format(SideSector.MAX_SIDE_SECTORS))
                rebuild = True
                break
        if VERBOSE:
            print("link to side sector {:d} OK, {!s}".format(sector_count, side_sector))
        side_sector = next_ss
        sector_count += 1

    if rebuild:
        msg = "Side sector chain needs rebuilding"
        errors = fix_error(msg, fix_rebuild_ss_chain, entry=path.entry, file_blocks=file_blocks)
        side_sectors = [] if errors else SideSector(IMAGE, *path.entry.side_sector_ts).all_side_sectors()
        # either the chain will have been re-created or it is still inconsistent
        return errors, len(side_sectors)

    sector_count = 0
    side_sector = SideSector(IMAGE, *path.entry.side_sector_ts)

    while side_sector:
        # whole image block usage
        remember_used(side_sector.track, side_sector.sector)

        if side_sector.number != sector_count:
            msg = "Side sector {:d}, mismatch in index, {:d}".format(sector_count, side_sector.number)
            errors += fix_error(msg, fix_ss_number, side_sector=side_sector, number=sector_count)
        elif VERBOSE:
            print("Side sector {:d} index OK".format(sector_count))
        if side_sector.record_len != path.entry.record_len:
            msg = "Side sector {:d}, mismatch in record length, {:d} & {:d} (directory)".format(sector_count, side_sector.record_len, path.entry.record_len)
            errors += fix_error(msg, fix_ss_rec_len, side_sector=side_sector, record_len=path.entry.record_len)
        elif VERBOSE:
            print("Side sector {:d}, side sector record length matches directory".format(sector_count))
        if not IMAGE.bam.is_allocated(side_sector.track, side_sector.sector):
            msg = "Side sector {:d} not allocated".format(sector_count)
            errors += fix_error(msg, fix_unalloc_block, block=side_sector)
        elif VERBOSE:
            print("Side sector {:d} allocated".format(sector_count))

        # next check the peer side sector links are correct
        this_ss_list = side_sector.all_side_sectors()
        if this_ss_list != [(ss.track, ss.sector) for ss in all_side_sectors]:
            this_ss_str = ', '.join(["{}:{}".format(t, s) for t, s in this_ss_list])
            all_ss_str = ', '.join([str(ss) for ss in all_side_sectors])
            msg = "Side sector {:d}, mismatch in peer links, {} & {}".format(sector_count, this_ss_str, all_ss_str)
            errors += fix_error(msg, fix_ss_list, side_sector=side_sector, ss_list=all_side_sectors)
        elif VERBOSE:
            print("Side sector {:d} peer links OK".format(sector_count))

        # finally check the data block links are correct
        this_data_list = side_sector.all_data_blocks()
        file_slice = file_blocks[sector_count*SideSector.MAX_DATA_LINKS:(sector_count+1)*SideSector.MAX_DATA_LINKS]
        if this_data_list != [(d.track, d.sector) for d in file_slice]:
            this_data_str = ', '.join(["{}:{}".format(t, s) for t, s in this_data_list])
            slice_str = ', '.join([str(d) for d in file_slice])
            msg = "Side sector {:d}, mismatch in data links, {} & {}".format(sector_count, this_data_str, slice_str)
            errors += fix_error(msg, fix_ss_data, side_sector=side_sector, data_list=file_slice)
        elif VERBOSE:
            print("Side sector {:d} contains {:d} data links".format(sector_count, len(this_data_list)))

        side_sector = side_sector.next_block()
        sector_count += 1

    return errors, sector_count


def check_path(path):
    """Check integrity of the contents of a file."""
    errors = 0
    file_blocks = []

    try:
        block = path.entry.first_block()
    except ValueError:
        print("File {!s}, invalid link to first data block (unfixed)".format(path.name))
        return 1
    if block.sector in USED_BLOCKS[block.track]:
        # linked to another file
        msg = "File {!s}, first block {!s} is in use".format(path.name, block)
        e = fix_error(msg, fix_entry_linked, entry=path.entry)
        if e:
            # not fixed, skip further processing of this file
            return 1
        block = path.entry.first_block()

    while block:
        # whole image block usage
        remember_used(block.track, block.sector)
        # this file block usage
        file_blocks.append(block)
        if VERBOSE:
            print("File {!s}, link to block OK, {!s}".format(path.name, block))
        if not IMAGE.bam.is_allocated(block.track, block.sector):
            msg = "File {!s}, block {!s} not allocated".format(path.name, block)
            errors += fix_error(msg, fix_unalloc_block, block=block)
        elif VERBOSE:
            print("File {!s}, block {!s} allocated".format(path.name, block))

        try:
            next_block = block.next_block()
        except ValueError:
            # invalid track/sector
            ts = block.get(0, 2)
            msg = "File {!s}, invalid link to block, {:d}:{:d}".format(path.name, *ts)
            # truncate file
            errors += fix_error(msg, fix_data_size, block=block, size=0xfe)
            break
        if next_block:
            if next_block in file_blocks:
                msg = "File {!s}, block {!s} links to previous data block {!s}".format(path.name, block, next_block)
                # truncate file
                errors += fix_error(msg, fix_data_size, block=block, size=0xfe)
                break
            if next_block.sector in USED_BLOCKS[next_block.track]:
                # linked to another file
                msg = "File {!s}, block {!s} links to in use block {!s}".format(path.name, block, next_block)
                errors += fix_error(msg, fix_file_linked, block=block)
                next_block = block.next_block()
        else:
            try:
                block_size = block.data_size
                if VERBOSE:
                    print("File {!s}, final block contains {:d} bytes".format(path.name, block_size))
            except IndexError:
                msg = "File {!s}, final block has invalid size".format(path.name)
                errors += fix_error(msg, fix_data_size, block=block, size=0xfe)

        block = next_block

    blocks_used = len(file_blocks)
    if path.entry.file_type == 'REL':
        ss_errors, ss_blocks_used = check_side_sectors(path, file_blocks)
        errors += ss_errors
        blocks_used += ss_blocks_used

    if blocks_used != path.size_blocks:
        msg = "File {!s}, mismatch in blocks used, {:d} & {:d} (actual)".format(path.name, path.size_blocks, blocks_used)
        errors += fix_error(msg, fix_block_count, entry=path.entry, count=blocks_used)
    elif VERBOSE:
        print("File {!s} uses {:d} blocks".format(path.name, blocks_used))

    return errors


def check_partition(path):
    """Check integrity of partition."""
    errors = 0

    try:
        block = path.entry.first_block()
    except ValueError:
        print("Partition {!s}, invalid link to first data block (unfixed)".format(path.name))
        return 1

    block_count = path.size_blocks
    while block_count:
        block_count -= 1

        if block.sector in USED_BLOCKS[block.track]:
            # linked to another file
            print("Partition {!s}, block {!s} is in use (unfixed)".format(path.name, block))
            return 1

        # whole image block usage
        remember_used(block.track, block.sector)
        if not IMAGE.bam.is_allocated(block.track, block.sector):
            msg = "Partition {!s}, block {!s} not allocated".format(path.name, block)
            errors += fix_error(msg, fix_unalloc_block, block=block)
        elif VERBOSE:
            print("Partition {!s}, block {!s} allocated".format(path.name, block))

        if block_count:
            # blocks are allocated contiguously
            try:
                sector = block.sector+1
                if sector >= IMAGE.max_sectors(block.track):
                    track = block.track+1
                    sector = 0
                else:
                    track = block.track
                block = Block(IMAGE, track, sector)
            except ValueError:
                print("Partition {!s}, invalid block, {:d}:{:d}".format(path.name, track, sector))
                return 1

    if VERBOSE:
        print("Partition {!s} uses {:d} blocks".format(path.name, path.size_blocks))

    return errors


def check_files():
    """Check integrity of all files."""
    errors = 0

    if not QUIET:
        print("\nChecking files...")
    for path in IMAGE.iterdir():
        if not path.entry.closed:
            msg = "File {!s}, unclosed".format(path.name)
            errors += fix_error(msg, fix_unclosed, entry=path.entry)

        if path.entry.file_type == 'CBM':
            errors += check_partition(path)
        else:
            errors += check_path(path)

    if errors == 0 and not QUIET:
        print("OK")

    return errors


def check_allocation():
    global USED_BLOCKS
    errors = 0

    if not QUIET:
        print("\nChecking block allocation...")
    for track in range(1, IMAGE.MAX_TRACK+1):
        max_sectors = IMAGE.max_sectors(track)
        _, bits = IMAGE.bam.get_entry(track)
        bam_used = {i for i, b in enumerate(bits) if b == '0' and i < max_sectors}
        delta = bam_used-USED_BLOCKS[track]

        if delta:
            delta_s = ', '.join([str(b) for b in delta])
            msg = "Track {:d}, sectors {} marked allocated when unused".format(track, delta_s)
            # generate an updated bitmask for sectors actually used
            fixed_bits = ''.join(['1' if i in delta else b for i, b in enumerate(bits)])
            errors += fix_error(msg, fix_track_alloc, track=track, bits=fixed_bits)
        elif VERBOSE:
            print("Track {:2d} OK".format(track))

    if errors == 0 and not QUIET:
        print("OK")

    return errors


def check_image(image_path):
    """Check the integrity of an image, return the number of uncorrected errors."""
    global IMAGE
    global USED_BLOCKS

    USED_BLOCKS = defaultdict(set)

    mode = 'w' if FIX else 'r'
    with DiskImage(image_path, mode) as IMAGE:
        errors = check_misc()
        errors += check_bam()
        errors += check_directory()
        errors += check_files()
        errors += check_allocation()

        if VERBOSE:
            print()
            for line in IMAGE.directory('ascii'):
                print(line)

    return errors


def fix_dos_version():
    """Fix DOS version field."""
    IMAGE.dos_version = IMAGE.DOS_VERSION
    if VERBOSE:
        print("Setting DOS version to "+chr(IMAGE.DOS_VERSION))
    return 0


def fix_dos_types():
    """Fix DOS format type fields."""
    IMAGE.dos_type = IMAGE.DOS_FORMAT
    if VERBOSE:
        print("Setting DOS format to "+chr(IMAGE.DOS_FORMAT))
    return 0


def fix_dir_link():
    """Fix link to directory block."""
    dir_block = Block(IMAGE, IMAGE.DIR_TRACK, 1)
    block = Block(IMAGE, IMAGE.DIR_TRACK, 0)
    block.set_next_block(dir_block)
    if VERBOSE:
        print("Setting link to {!s}".format(dir_block))
    return 0


def fix_bam_entry(track):
    """Fix track entry in BAM."""
    _, bits = IMAGE.bam.get_entry(track)
    counted = bits.count('1')
    IMAGE.bam.set_entry(track, counted, bits)
    if VERBOSE:
        print("Setting track {:d} to {:d} & {}".format(track, counted, bits))
    return 0


def fix_unalloc_block(block):
    """Allocate an in-use block."""
    IMAGE.bam.set_allocated(block.track, block.sector)
    if VERBOSE:
        print("Allocating block {!s}".format(block))
    return 0


def fix_data_size(block, size):
    """Fix data used in a block."""
    block.data_size = size
    if VERBOSE:
        print("Setting data size of {!s} to {:d}".format(block, size))
    return 0


def fix_ftype(entry, ftype):
    """Fix entry file type."""
    entry.file_type = ftype
    if VERBOSE:
        print("Setting entry file type to "+entry.file_type)
    return 0


def fix_rel_data(entry):
    """Clear relative file fields."""
    entry.side_sector_ts = (0, 0)
    entry.record_len = 0
    if VERBOSE:
        print("Clearing relative file data")
    return 0


def fix_ss_number(side_sector, number):
    """Fix side sector number."""
    side_sector.number = number
    if VERBOSE:
        print("Setting side sector index to {:d}".format(number))
    return 0


def fix_ss_rec_len(side_sector, record_len):
    """Fix side sector record length."""
    side_sector.record_len = record_len
    if VERBOSE:
        print("Setting side sector record length to {:d}".format(record_len))
    return 0


def fix_rebuild_ss_chain(entry, file_blocks):
    """Reconstruct all side sectors from scratch."""
    side_sectors = []
    alloc_from = file_blocks[-1]
    last_ss = None

    while file_blocks:
        block = IMAGE.alloc_next_block(alloc_from.track, alloc_from.sector)
        ss = SideSector(IMAGE, block.track, block.sector)
        remember_used(block.track, block.sector)
        ss.number = len(side_sectors)
        ss.record_len = entry.record_len
        ss.set_data_blocks(file_blocks[:SideSector.MAX_DATA_LINKS])
        if last_ss:
            last_ss.set_next_block(ss)
        else:
            entry.side_sector_ts = (ss.track, ss.sector)
        side_sectors.append(ss)
        last_ss = ss
        alloc_from = ss
        file_blocks = file_blocks[SideSector.MAX_DATA_LINKS:]

    # update the peer links of all side sectors
    for ss in side_sectors:
        ss.set_peers([(ss.track, ss.sector) for ss in side_sectors])

    if VERBOSE:
        print("Rebuilding {:d} side sectors".format(len(side_sectors)))
    return 0


def fix_ss_list(side_sector, ss_list):
    """Fix list of peer side sectors."""
    side_sector.set_peers([(ss.track, ss.sector) for ss in ss_list])
    if VERBOSE:
        print("Setting peer links to", ', '.join([str(ss) for ss in ss_list]))
    return 0


def fix_ss_data(side_sector, data_list):
    """Fix list of data blocks in side sector."""
    side_sector.set_data_blocks(data_list)
    if VERBOSE:
        print("Setting data links to", ', '.join([str(d) for d in data_list]))
    return 0


def fix_unclosed(entry):
    """Mark an entry as closed."""
    entry.closed = True
    if VERBOSE:
        print("Setting entry file state as closed")
    return 0


def fix_entry_linked(entry):
    """Clone a file whose first block is linked to another."""
    new_block = IMAGE.clone_chain(entry.first_block())
    entry.start_ts = (new_block.track, new_block.sector)
    if VERBOSE:
        print("Duplicating blocks, new first block {!s}".format(new_block))
    return 0


def fix_file_linked(block):
    """Clone chain of blocks for file linked to another."""
    new_block = IMAGE.clone_chain(block.next_block())
    block.set_next_block(new_block)
    if VERBOSE:
        print("Duplicating blocks, new next block {!s}".format(new_block))
    return 0


def fix_block_count(entry, count):
    """Fix entry size in blocks."""
    entry.size = count
    if VERBOSE:
        print("Setting block count to {:d}".format(count))
    return 0


def fix_track_alloc(track, bits):
    """Fix BAM entry for a track."""
    IMAGE.bam.set_entry(track, bits.count('1'), bits)
    if VERBOSE:
        print("Setting track {:d} bits to {}".format(track, bits))
    return 0


def main():
    global FIX
    global YES
    global VERBOSE
    global QUIET

    parser = argparse.ArgumentParser(description='Check and fix Commodore disk images.')
    parser.add_argument('image', type=Path, help='image filename')
    parser.add_argument('--fix', '-f', action='store_true', help='Fix errors detected')
    parser.add_argument('--yes', '-y', action='store_true', help='Answer questions with "yes"')
    parser.add_argument('--verbose', '-v', action='store_true', help='Verbose output')
    parser.add_argument('--quiet', '-q', action='store_true', help='No output')

    args = parser.parse_args()
    FIX = args.fix
    YES = args.yes
    VERBOSE = args.verbose
    QUIET = args.quiet

    try:
        errors = check_image(args.image)
    except KeyboardInterrupt:
        sys.exit("\nAbort, discarding all changes")
    except Exception as e:
        sys.exit("\nException: %s" % str(e))

    if errors:
        sys.exit("\n{:d} unfixed errors".format(errors))
