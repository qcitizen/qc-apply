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

parser.add_argument(
    '-l', '--lower-case',
    action='store_false',
    default=True,
    dest='case_flag',
    help="compression is NOT case-sensitive."
)

input_group.add_argument(
    '-s',
    dest='target_string',
    nargs='+',
    help="read string from stdin."
)

input_group.add_argument(
    '-i', '--infile',
    dest='infile',
    help="path to input file."
)

parser.add_argument(
    '-o', '--outfile',
    dest='outfile',
    help="path to output file."
)


def compress(target_string, case_flag):
    target_string = re.sub(r'[0-9]+', '', target_string)
    if not case_flag:
        target_string = target_string.lower()
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
    case_flag = args.case_flag
    output_data = []
    if args.infile:
        file_path = Path(args.infile)
        with open(file_path) as f:
            input_data = f.readlines()

        for line in input_data:
            output_data.append(compress(line, case_flag))
    else:
        for target_string in args.target_string:
            output_data.append(compress(target_string, case_flag))

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
