from .block import Block
from .d64_image import D64Image
from .d71_bam import D71BAM


class D71Image(D64Image):

    DOS_VERSION = ord('2')
    DOS_FORMAT = ord('A')
    MAX_TRACK = 70
    EXTRA_BAM_TRACK = 53
    INTERLEAVE = 6
    DIR_INTERLEAVE = 3
    TRACK_SECTOR_MAX = ((21, (1, 17)), (19, (18, 24)), (18, (25, 30)), (17, (31, 35)),
                        (21, (36, 52)), (19, (53, 59)), (18, (60, 65)), (17, (66, 70)))
    IMAGE_SIZES = (349696, 351062)

    def __init__(self, filename):
        super().__init__(filename)
        self.bam = D71BAM(self)

    def open(self, mode):
        super().open(mode)
        self.extra_bam_block = Block(self, self.EXTRA_BAM_TRACK, 0)

    def alloc_next_block(self, track, sector, directory=False):
        return self._alloc_next_block(track, sector, self.DIR_INTERLEAVE if directory else self.INTERLEAVE)

    @classmethod
    def create(cls, filepath, disk_name, disk_id):
        """Create an empty disk image."""
        super().create(filepath)

        image = cls(filepath)
        try:
            image.open('r+b')

            # block 18/0 contains part of the BAM and various identifying fields
            bam_block = Block(image, cls.DIR_TRACK, 0)
            bam_block.set(0x90, b'\xa0' * 0x1b)
            image.name = disk_name
            image.id = disk_id
            image.dos_type = cls.DOS_FORMAT
            image.dos_version = cls.DOS_VERSION

            # populate the BAM with all free blocks
            for sectors, range_ in cls.TRACK_SECTOR_MAX:
                for t in range(range_[0], range_[1]+1):
                    bits_free = '1' * sectors
                    image.bam.set_entry(t, sectors, bits_free)

            # block 18/1 contains 8 empty directory entries
            dir_block = Block(image, cls.DIR_TRACK, 1)
            dir_block.data_size = 0xfe

            # link BAM block to directory block
            bam_block.set_next_block(dir_block)

            # allocate both blocks
            image.bam.set_allocated(cls.DIR_TRACK, 0)
            image.bam.set_allocated(cls.DIR_TRACK, 1)

            # all of track 53 is allocated
            _, free_bits = image.bam.get_entry(cls.EXTRA_BAM_TRACK)
            free_bits = free_bits.replace('1', '0')
            image.bam.set_entry(cls.EXTRA_BAM_TRACK, 0, free_bits)
        finally:
            image.close()
