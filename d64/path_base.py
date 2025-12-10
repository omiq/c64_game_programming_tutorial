
class PathBase(object):
    def __init__(self, image, entry=None, name=None):
        self.image = image
        self.entry = entry
        self._name = name

    def exists(self):
        """Return `True` if path exists."""
        return self.entry is not None

    def assert_has_entry(self):
        if self.entry is None:
            raise FileNotFoundError("File not found: "+str(self.name))

    def unlink(self):
        """Delete directory entry for this path."""
        self.assert_has_entry()

        self.entry.free_blocks()
        self.entry.file_type = 0

    def rename(self, other):
        """Rename this directory entry, replacing another entry if it exists."""
        self.assert_has_entry()

        if isinstance(other, str) or isinstance(other, bytes):
            other = self.image.path(other)

        if other.entry:
            other.unlink()
        self.entry.name = other.name
        return self

    replace = rename

    @property
    def name(self):
        if self.entry:
            return self.entry.name
        return self._name

    @property
    def size_blocks(self):
        """Return file size in blocks."""
        self.assert_has_entry()

        return self.entry.size
