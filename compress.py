#!/usr/bin/env python

import argparse
from pathlib import Path
import re
import sys


parser = argparse.ArgumentParser(
    prog='compress',
    description='compress strings',
)

input_group = parser.add_mutually_exclusive_group()

input_group.add_argument(
    '-s',
    dest='target_string',
    help="Read string from stdin."
)

input_group.add_argument(
    '-i', '--infile',
    dest='infile',
    help="Path to input file."
)

parser.add_argument(
    '-o', '--outfile',
    dest='outfile',
    help="Path to output file."
)


def compress(target_string):
    compressed_string = ''
    g = re.finditer(r'([a-zA-Z])(\1*)', target_string)
    for m in g:
        group_len = len(m.group())
        if group_len > 1:
            compressed_string += f"{m.group()[:1]}{group_len}"
        else:
            compressed_string += f"{m.group()[:1]}"

    return compressed_string


def main(args):
    output_data = []
    if args.infile:
        file_path = Path(args.infile)
        with open(file_path) as f:
            input_data = f.readlines()

        for line in input_data:
            output_data.append(compress(line))
    else:
        output_data.append(compress(args.target_string))

    if args.outfile:
        file_path = Path(args.outfile)
        with open(file_path, 'w+') as f:
            for s in output_data:
                f.write(f"{s}\n")
    else:
        for s in output_data:
            print(s)


if __name__ == '__main__':
    args = parser.parse_args()
    if len(sys.argv) < 2:
        parser.print_help()
        sys.exit()
    main(args)
