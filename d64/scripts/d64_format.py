import argparse
import sys

from pathlib import Path

from d64.d64_image import D64Image
from d64.d71_image import D71Image
from d64.d81_image import D81Image


CREATE_METHODS = {
    'd64': D64Image.create,
    'd71': D71Image.create,
    'd81': D81Image.create
}


def main():
    parser = argparse.ArgumentParser(description='Create empty Commodore disk images.')
    parser.add_argument('label', help='disk label')
    parser.add_argument('id', help='disk identifier')
    parser.add_argument('filename', type=Path, help='image filename')
    parser.add_argument('--type', default='d64', choices=CREATE_METHODS.keys(), help='image type')
    args = parser.parse_args()

    if args.filename.exists():
        sys.exit("{!s} already exists".format(args.filename))
    print("Creating empty disk image as {!s}, {}:{}, type {}".format(args.filename, args.label, args.id, args.type))

    CREATE_METHODS[args.type](args.filename, args.label.encode(), args.id.encode())
