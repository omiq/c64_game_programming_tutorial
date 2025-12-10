import struct

from .bam import BAM


class D64BAM(BAM):

    BAM_OFFSET = 4
    BAM_ENTRY_SIZE = 4

    def get_entry(self, track):
        """Return a tuple of total free blocks and a string of free blocks for a track."""
        if track < 1 or track > self.image.MAX_TRACK:
            raise ValueError("Invalid track, %d" % track)

        start = self.BAM_OFFSET+(track-1)*self.BAM_ENTRY_SIZE
        packf = "<{}B".format(self.BAM_ENTRY_SIZE)
        e = struct.unpack(packf, self.image.dir_block.get(start, start+self.BAM_ENTRY_SIZE))
        free_bits = ''
        for b in e[1:]:
            free_bits += ''.join(reversed(format(b, '08b')))

        return e[0], free_bits

    def set_entry(self, track, total, free_bits):
        """Update the block allocation entry for a track."""
        if track < 1 or track > self.image.MAX_TRACK:
            raise ValueError("Invalid track, %d" % track)

        start = self.BAM_OFFSET+(track-1)*self.BAM_ENTRY_SIZE
        packf = "<{}B".format(self.BAM_ENTRY_SIZE)
        entry = [total]
        while free_bits:
            val = ''.join(reversed(free_bits[:8]))
            entry.append(int(val, 2))
            free_bits = free_bits[8:]
        bin_entry = struct.pack(packf, *entry)
        self.image.dir_block.set(start, bin_entry)
