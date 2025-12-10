import struct

from .block import Block


class SideSector(Block):
    """Relative file side sector block."""
    MAX_SIDE_SECTORS = 6
    MAX_DATA_LINKS = 120

    @property
    def number(self):
        """Return this side sector block number (0-5)."""
        return self.get(2)

    @property
    def record_len(self):
        """Return record length."""
        return self.get(3)

    @number.setter
    def number(self, number):
        """Modify side sector block number."""
        if number < 0 or number >= self.MAX_SIDE_SECTORS:
            raise ValueError("Invalid side sector index, %d" % number)
        self.set(2, number)

    @record_len.setter
    def record_len(self, rec_len):
        """Modify side sector record length."""
        self.set(3, rec_len)

    def all_side_sectors(self):
        """Return an array of all side sectors track & sector."""
        ss_bin = self.get(4, 0x10)
        return [(ss_bin[i], ss_bin[i+1]) for i in range(0, self.MAX_SIDE_SECTORS*2, 2) if ss_bin[i]]

    def all_data_blocks(self):
        """Return an array of all data blocks in this side sector."""
        links_bin = self.get(0x10, 0x100)
        return [(links_bin[i], links_bin[i+1]) for i in range(0, 0xf0, 2) if links_bin[i]]

    def clear_side_sectors(self):
        """Zero out all side sector links."""
        self.set(4, bytes(self.MAX_SIDE_SECTORS*2))

    def clear_data_blocks(self):
        """Zero out all data block links."""
        self.set(0x10, bytes(0xf0))
        self.data_size = self.MAX_SIDE_SECTORS*2+2

    def add_side_sector(self, other):
        """Append a new side sector to this side sector's list."""
        self.set(4+other.number*2, struct.pack('<BB', other.track, other.sector))

    def add_data_block(self, block):
        """Append a new data block to this side sector."""
        self.set(self.data_size+2, struct.pack('<BB', block.track, block.sector))
        self.data_size += 2

    def set_peers(self, ss_ts_list):
        """Set the list of all side sectors."""
        padded_ss_list = ss_ts_list+[(0, 0)]*(self.MAX_SIDE_SECTORS-len(ss_ts_list))
        fmt = "<{}B".format(self.MAX_SIDE_SECTORS*2)
        self.set(4, struct.pack(fmt, *[item for sublist in padded_ss_list for item in sublist]))

    def set_data_blocks(self, data_list):
        """Set the list of data block links."""
        padded_data_list = [(d.track, d.sector) for d in data_list]+[(0, 0)]*(self.MAX_DATA_LINKS-len(data_list))
        fmt = "<{}B".format(self.MAX_DATA_LINKS*2)
        self.set(0x10, struct.pack(fmt, *[item for sublist in padded_data_list for item in sublist]))
        if self.is_final:
            self.data_size = len(data_list)*2+self.MAX_SIDE_SECTORS*2+2
