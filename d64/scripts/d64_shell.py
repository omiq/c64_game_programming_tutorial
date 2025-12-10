import argparse
import glob
import string
import sys

from pathlib import Path

import cmd2

from d64 import DiskImage


def is_image_path(p):
    return p[0] in string.digits and p[1] == ':'


class D64Shell(cmd2.Cmd):
    def __init__(self):
        super().__init__()

        self.encoding = 'ascii'
        self.add_settable(cmd2.Settable('encoding', str, 'Text encoding'))

        self.images = {}

    def expand_paths(self, files_in):
        ret = []
        for f in files_in:
            if is_image_path(f):
                if len(f) == 2:
                    # just a drive
                    ret.append(f)
                else:
                    image = self.images[int(f[0])]
                    ret += [f[:2]+n.name.decode(self.encoding) for n in image.glob(f[2:].encode(self.encoding))]
            else:
                ret += glob.glob(f)
        return ret

    attach_parser = argparse.ArgumentParser()
    attach_parser.add_argument('--drive', type=int, help="drive number")
    attach_parser.add_argument('--read-only', action='store_true', help="prevent modifications to image")
    attach_parser.add_argument('image', help="image file name")

    @cmd2.with_argparser(attach_parser)
    def do_attach(self, args):
        """Attach an image to a drive number."""
        if args.drive is None:
            # find first free drive
            for d in range(0, 10):
                if d not in self.images:
                    args.drive = d
                    break
            if args.drive is None:
                self.perror("All drives in use")
                return None
        elif args.drive in self.images:
            self.perror("Drive {} in use".format(args.drive))
            return None

        self.images[args.drive] = DiskImage(args.image).open()
        self.poutput("Attached {} to {}".format(args.image, args.drive))

    detach_parser = argparse.ArgumentParser()
    detach_parser.add_argument('drive', type=int, nargs='+', help="drive to detach")

    @cmd2.with_argparser(detach_parser)
    def do_detach(self, args):
        """Detach an image from a drive letter."""
        for drive in args.drive:
            if drive in self.images:
                self.images[drive].close()
                del self.images[drive]
                self.poutput("Detached {}".format(drive))
            else:
                self.perror("Invalid drive: {}". format(drive))

    def do_images(self, args):
        """Display the attached images."""
        if self.images:
            for d in sorted(self.images.keys()):
                self.poutput("    {}  {!s}".format(d, self.images[d]))
        else:
            self.poutput("No attached images")

    dir_parser = argparse.ArgumentParser()
    dir_parser.add_argument('drive', type=int, nargs='*', help="drive to list")

    @cmd2.with_argparser(dir_parser)
    def do_dir(self, args):
        """Display directory of a drive."""
        if args.drive:
            drive_list = args.drive
        else:
            drive_list = sorted(self.images.keys())

        first = True
        for d in drive_list:
            if d in self.images:
                if first:
                    first = False
                else:
                    self.poutput('')
                for l in self.images[d].directory(self.encoding, drive=d):
                    self.poutput(l)
            else:
                self.perror("Invalid drive: {}". format(d))

    copy_parser = argparse.ArgumentParser()
    copy_parser.add_argument('file', nargs=(2,), help="file source or destination")

    @cmd2.with_argparser(copy_parser)
    def do_copy(self, args):
        files = self.expand_paths(args.file)
        print(str(files))

        if is_image_path(files[-1]):
            # destination is an image
            dest = files[-1]
            if len(files) > 2 and len(dest) != 2:
                self.perror("Target '{}' is not a drive".format(dest))
                return None
            raise NotImplementedError("Destination is image")
        else:
            # destination is file system
            dest = Path(files[-1])
            if len(files) > 2:
                if not dest.is_dir():
                    self.perror("Target '{!s}' is not a directory".format(dest))
                    return None

    complete_attach = cmd2.Cmd.path_complete


def main():
    c = D64Shell()
    ret = c.cmdloop()

    # close any attached images
    for i in c.images.values():
        i.close()

    sys.exit(ret)
