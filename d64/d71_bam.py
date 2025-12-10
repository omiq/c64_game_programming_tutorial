import struct

from .d64_bam import D64BAM


class D71BAM(D64BAM):

    FIRST_TRACK_ON_REVERSE = 36

    def get_entry(self, track):
        """Return a tuple of total free blocks and a string of free blocks for a track."""
        if track < self.FIRST_TRACK_ON_REVERSE:
            # tracks below 36 are as for a d64 image
            return super().get_entry(track)
        if track > self.image.MAX_TRACK:
            raise ValueError("Invalid track, %d" % track)

        # tracks 36 and above are split between 18/0 and 53/0
        total = self.image.dir_block.get(0xb9+track)
        start = (track-self.FIRST_TRACK_ON_REVERSE)*(self.BAM_ENTRY_SIZE-1)
        packf = "<{}B".format(self.BAM_ENTRY_SIZE-1)
        e = struct.unpack(packf, self.image.extra_bam_block.get(start, start+self.BAM_ENTRY_SIZE-1))
        free_bits = ''
        for b in e:
            free_bits += ''.join(reversed(format(b, '08b')))
        return total, free_bits

    def set_entry(self, track, total, free_bits):
        """Update the block allocation entry for a track."""
        if track < self.FIRST_TRACK_ON_REVERSE:
            # tracks below 36 are as for a d64 image
            super().set_entry(track, total, free_bits)
            return
        if track > self.image.MAX_TRACK:
            raise ValueError("Invalid track, %d" % track)

        # tracks 36 and above are split between 18/0 and 53/0
        self.image.dir_block.set(0xb9+track, total)
        start = (track-self.FIRST_TRACK_ON_REVERSE)*(self.BAM_ENTRY_SIZE-1)
        packf = "<{}B".format(self.BAM_ENTRY_SIZE-1)
        entry = []
        while free_bits:
            val = ''.join(reversed(free_bits[:8]))
            entry.append(int(val, 2))
            free_bits = free_bits[8:]
        bin_entry = struct.pack(packf, *entry)
        self.image.extra_bam_block.set(start, bin_entry)
