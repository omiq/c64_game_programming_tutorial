from .exceptions import DiskFullError
from .file import File, RelativeFile
from .path_base import PathBase


class DOSPath(PathBase):
    """Encapsulate a path within an image."""
    @property
    def size_bytes(self):
        """Return file size in bytes."""
        if self.entry is None:
            raise FileNotFoundError("File not found: "+str(self.name))

        size = 0
        block = self.entry.first_block()
        while block:
            size += block.data_size
            block = block.next_block()

        return size

    def open(self, mode='r', ftype=None, record_len=None):
        """Return new file object."""
        if mode not in ('r', 'rb', 'w', 'wb'):
            raise ValueError("Invalid mode, "+mode)

        if mode[0] == 'r':
            self.assert_has_entry()
        else:
            # open file for write
            if not self.image.writeable:
                raise PermissionError("Image is read-only")

            if self.entry:
                # truncate an existing file
                self.entry.free_blocks()
            else:
                # no existing entry, create a new one
                if ftype is None:
                    raise ValueError("File type missing for new file")
                ftype = ftype.upper()
                if ftype == 'REL' and record_len is None:
                    raise ValueError("Record length missing for new relative file")
                entry = self.image.get_free_entry()
                if entry is None:
                    raise DiskFullError()

                entry.file_type = ftype
                entry.name = self._name
                entry.record_len = record_len if ftype == 'REL' else 0
                self.entry = entry
                self._name = None

            self.entry.reset()

        if self.entry.file_type == 'REL':
            return RelativeFile(self.entry, mode)

        return File(self.entry, mode)

    @staticmethod
    def wildcard_match(fname, ftype, wildcard):
        """Return True if file matches a DOS wildcard."""

        if b'=' in wildcard:
            # file type
            if wildcard[-1] == ord('='):
                raise ValueError("Invalid wildcard, "+str(wildcard))
            wildcard, wftype = wildcard.split(b'=', 1)
            if ord(ftype[0]) != wftype[0]:
                return False

        for w, f in zip(wildcard, fname):
            if w == ord('?'):
                # matches any character
                continue
            if w == ord('*'):
                # matches rest of file name
                return True
            if w != f:
                return False

        if len(fname)+1 == len(wildcard) and wildcard.endswith(b'*'):
            # zero length match
            return True
        return len(fname) == len(wildcard)
