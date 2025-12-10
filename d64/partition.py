from .exceptions import ConsistencyError, DiskFullError
from .path_base import PathBase


class Partition(PathBase):
    def create(self, block_start, size_blocks):
        """Create a new partition."""
        if self.entry:
            raise FileExistsError("File exists: "+str(self.name))

        entry = self.image.get_free_entry()
        if entry is None:
            raise DiskFullError()

        entry.file_type = 'CBM'
        entry.name = self._name
        entry.size = size_blocks
        entry.set_first_block(block_start)

        # allocate all blocks
        alloc_blocks = []
        try:
            for block in entry.partition_blocks():
                self.image.bam.set_allocated(block.track, block.sector)
                alloc_blocks.append(block)
        except (ValueError, ConsistencyError):
            # free blocks that were allocated
            for block in alloc_blocks:
                self.image.free_block(block)
            entry.file_type = 0
            entry.reset()
            raise

        self.entry = entry
        self._name = None

    def blocks(self):
        """Generator to return each block of a partition."""
        self.assert_has_entry()

        yield from self.entry.partition_blocks()
