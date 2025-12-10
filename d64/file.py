from .block import Block
from .exceptions import DiskFullError
from .side_sector import SideSector


class File(object):
    """Read and write access to files."""
    def __init__(self, entry, mode):
        self.entry = entry
        if mode[0] == 'r':
            self.block = entry.first_block()
            self.read_pos = 2
        else:
            self.image = entry.block.image
            self.block = None

    def __enter__(self):
        return self

    def __exit__(self, exc_type, _, __):
        if exc_type is None:
            self.close()

    def get_first_block(self):
        """Return the first empty block for a file write."""
        next_block = self.image.alloc_first_block()
        if next_block is None:
            raise DiskFullError()
        next_block.data_size = 0
        self.entry.set_first_block(next_block)
        self.entry.size = 1
        return next_block

    def get_new_block(self):
        """Get a new empty block for a file write."""
        next_block = self.image.alloc_next_block(self.block.track, self.block.sector)
        if next_block is None:
            raise DiskFullError()
        next_block.data_size = 0
        self.block.set_next_block(next_block)
        self.entry.size += 1
        return next_block

    def read(self, count=-1):
        """Read bytes from file."""
        ret = b''

        while count:
            remaining = self.block.data_size-(self.read_pos-2)
            if remaining == 0:
                break

            # read as much as is wanted from the current block
            length = remaining if count == -1 else min(count, remaining)
            ret += self.block.get(self.read_pos, self.read_pos+length)
            self.read_pos += length
            if count != -1:
                count -= length

            if self.block.is_final:
                # no more blocks, end of file
                break

            if self.read_pos == Block.SECTOR_SIZE:
                # end of block, move on to the next block
                self.block = self.block.next_block()
                self.read_pos = 2

        return ret

    def write(self, data):
        """Write data to a file."""
        written = 0

        if self.block is None:
            # allocate first block
            self.block = self.get_first_block()

        while data:
            remaining_space = Block.SECTOR_SIZE-(self.block.data_size+2)
            if remaining_space:
                length = min(remaining_space, len(data))
                self.block.set(self.block.data_size+2, data[:length])
                self.block.data_size += length
                written += length
                data = data[length:]
            else:
                # end of block, append a new one
                self.block = self.get_new_block()

        return written

    def close(self):
        """Close file."""
        if self.block is None:
            # file open for write, no data written
            # DOS files cannot be empty, they must contain at least one byte
            self.write(b'\r')


class RelativeFile(File):
    """Read and write access to relative files."""
    def get_first_block(self):
        """Return the first empty block for a file write."""
        data_block = super().get_first_block()
        block = self.image.alloc_next_block(data_block.track, data_block.sector)
        side_sector = SideSector(self.image, block.track, block.sector)
        side_sector.number = 0
        side_sector.record_len = self.entry.record_len
        side_sector.add_side_sector(side_sector)
        side_sector.clear_data_blocks()
        side_sector.add_data_block(data_block)
        self.entry.side_sector_ts = (side_sector.track, side_sector.sector)
        self.side_sector = side_sector
        self.entry.size += 1
        return data_block

    def get_new_block(self):
        """Get a new empty block for a file write."""
        if len(self.side_sector.all_data_blocks()) == SideSector.MAX_DATA_LINKS:
            # current side sector is full, allocate a new one
            block = self.image.alloc_next_block(self.side_sector.track, self.side_sector.sector)
            side_sector = SideSector(self.image, block.track, block.sector)
            side_sector.number = self.side_sector.number+1
            side_sector.record_len = self.entry.record_len
            side_sector.set_peers(self.side_sector.all_side_sectors())
            side_sector.clear_data_blocks()
            self.side_sector.set_next_block(side_sector)
            self.side_sector = side_sector
            self.entry.size += 1

            # update the peer list of all side sectors (including the new one)
            ss = SideSector(self.image, *self.entry.side_sector_ts)
            while ss:
                ss.add_side_sector(side_sector)
                ss = ss.next_block()

        data_block = super().get_new_block()
        self.side_sector.add_data_block(data_block)
        return data_block

    def read_record(self):
        """Read a complete record from a file."""
        return self.read(self.entry.record_len)

    def write(self, data):
        """Write one or more records to a file."""
        ret = 0
        while data:
            chunk = data[:self.entry.record_len]
            ret += super().write(chunk.ljust(self.entry.record_len, b'\x00'))
            data = data[self.entry.record_len:]
        return ret

    def close(self):
        """Close file."""
        # pad rest of data block with empty records
        while self.block is None or Block.SECTOR_SIZE-(self.block.data_size+2) >= self.entry.record_len:
            self.write(b'\xff')
