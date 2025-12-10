from .block import Block
from .dir_entry import DirEntry


class D81DirEntry(DirEntry):
    FTYPE_STR = ('DEL', 'SEQ', 'PRG', 'USR', 'REL', 'CBM', '???', '???')

    def free_blocks(self):
        """Free any data blocks and side sectors."""
        if self.file_type == 'CBM':
            for block in self.partition_blocks():
                block.image.free_block(block)
        else:
            super().free_blocks()

    def partition_blocks(self):
        """Generator to return each block of a partition."""
        block = self.first_block()
        block_count = self.size

        while block_count:
            yield block

            block_count -= 1
            if block_count:
                # blocks are allocated contiguously
                sector = block.sector+1
                if sector >= block.image.max_sectors(block.track):
                    # end of current track
                    track = block.track+1
                    sector = 0
                else:
                    track = block.track
                block = Block(block.image, track, sector)
