import struct


class Block(object):
    """Storage block."""
    SECTOR_SIZE = 256

    def __init__(self, image, track, sector):
        self.track = track
        self.sector = sector
        self.start = image.block_start(track, sector)
        self.image = image

    @property
    def is_final(self):
        """Return `True` if no next block."""
        return self.image.map[self.start] == 0

    @property
    def data_size(self):
        """Return the amount of data within this block."""
        if not self.is_final:
            return self.SECTOR_SIZE-2
        s = self.image.map[self.start+1]
        if s == 0:
            raise IndexError("Invalid data size")
        return s-1

    @data_size.setter
    def data_size(self, size):
        """Update the amount of data within this block."""
        self.image.map[self.start] = 0
        self.image.map[self.start+1] = size+1

    def next_block(self):
        """Return block linked from this one."""
        if self.is_final:
            return None
        t, s = struct.unpack('<BB', self.image.map[self.start:self.start+2])
        return self.__class__(self.image, t, s)

    def set_next_block(self, next_block):
        self.image.map[self.start:self.start+2] = struct.pack('<BB', next_block.track, next_block.sector)

    def get(self, rel_start, rel_end=None):
        """Return a slice of data within this block."""
        if rel_end is None:
            return self.image.map[self.start+rel_start]
        return self.image.map[self.start+rel_start:self.start+rel_end]

    def set(self, rel_start, data):
        """Update a slice of data within this block."""
        if not self.image.writeable:
            raise PermissionError("Image is read-only")

        if isinstance(data, int):
            self.image.map[self.start+rel_start] = data
        else:
            self.image.map[self.start+rel_start:self.start+rel_start+len(data)] = data

    def __eq__(self, other):
        """Return `True` if both objects refer to the same track/sector."""
        return (self.track, self.sector) == (other.track, other.sector)

    def __str__(self):
        """Return string representation of a block."""
        return "{}:{}".format(self.track, self.sector)

    def __repr__(self):
        t, s = struct.unpack('<BB', self.image.map[self.start:self.start+2])
        return "<Block {}:{} ({}:{})>".format(self.track, self.sector, t, s)
