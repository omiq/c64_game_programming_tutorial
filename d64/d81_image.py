from .block import Block
from .d81_bam import D81BAM
from .d81_dir_entry import D81DirEntry
from .dos_image import DOSImage
from .partition import Partition


class D81Image(DOSImage):

    DIR_ENTRY = D81DirEntry
    DOS_VERSION = ord('3')
    DOS_FORMAT = ord('D')
    MAX_TRACK = 80
    DIR_TRACK = 40
    DIR_SECTOR = 3
    INTERLEAVE = 1
    TRACK_SECTOR_MAX = ((40, (1, 80)),)
    IMAGE_SIZES = (819200, 822400)

    def __init__(self, filename):
        self.bam = D81BAM(self)
        super().__init__(filename)

    def open(self, mode):
        super().open(mode)
        self.side_a_bam_block = Block(self, self.DIR_TRACK, 1)
        self.side_b_bam_block = Block(self, self.DIR_TRACK, 2)

    def partition(self, name):
        paths = [e for e in self.glob(name)]
        if paths:
            if paths[0].entry.file_type == 'CBM':
                # existing partition
                return Partition(self, entry=paths[0].entry)
            raise TypeError("Entry is not a partition")
        return Partition(self, name=name)

    def alloc_next_block(self, track, sector, directory=False):
        return self._alloc_next_block(track, sector, self.INTERLEAVE)

    @property
    def dos_version(self):
        return self.dir_block.get(0x19)

    @property
    def name(self):
        name = self.dir_block.get(4, 0x14)
        return name.rstrip(b'\xa0')

    @property
    def id(self):
        id = self.dir_block.get(0x16, 0x18)
        return id

    @property
    def dos_type(self):
        return self.dir_block.get(2)

    @dos_version.setter
    def dos_version(self, version):
        self.dir_block.set(0x19, version)

    @name.setter
    def name(self, nam):
        self.dir_block.set(4, nam[:16].ljust(16, b'\xa0'))

    @id.setter
    def id(self, did):
        if len(did) != 2:
            raise ValueError("Invalid disk id, "+str(did))
        self.dir_block.set(0x16, did)
        # update copy in BAM blocks
        self.side_a_bam_block.set(4, did)
        self.side_b_bam_block.set(4, did)

    @dos_type.setter
    def dos_type(self, dtype):
        self.dir_block.set(2, dtype)
        self.dir_block.set(0x1a, dtype)
        # update copy in BAM blocks
        self.side_a_bam_block.set(2, dtype)
        self.side_a_bam_block.set(3, dtype ^ 0xff)
        self.side_b_bam_block.set(2, dtype)
        self.side_b_bam_block.set(3, dtype ^ 0xff)

    @classmethod
    def create(cls, filepath, disk_name, disk_id):
        """Create an empty disk image."""
        super().create(filepath)

        image = cls(filepath)
        try:
            image.open('r+b')

            # block 40/0 contains various identifying fields
            header_block = Block(image, cls.DIR_TRACK, 0)
            header_block.set(4, b'\xa0' * 0x15)
            image.name = disk_name
            image.id = disk_id
            image.dos_type = cls.DOS_FORMAT
            image.dos_version = cls.DOS_VERSION

            # populate the BAM with all free blocks
            for sectors, range_ in cls.TRACK_SECTOR_MAX:
                for t in range(range_[0], range_[1]+1):
                    bits_free = '1' * sectors
                    image.bam.set_entry(t, sectors, bits_free)

            # block 40/3 contains 8 empty directory entries
            dir_block = Block(image, cls.DIR_TRACK, 3)
            dir_block.data_size = 0xfe

            # blocks 40/1 and 40/2 hold the BAM
            bam1_block = Block(image, cls.DIR_TRACK, 1)
            bam2_block = Block(image, cls.DIR_TRACK, 2)
            bam2_block.data_size = 0xfe

            # link BAM 1 block to BAM 2 block
            bam1_block.set_next_block(bam2_block)

            # link header block to directory block
            header_block.set_next_block(dir_block)

            # allocate all blocks
            for i in range(0, 4):
                image.bam.set_allocated(cls.DIR_TRACK, i)
        finally:
            image.close()
