import sys
from compress import CompressString


def print_compress_string(string):
	print(f'{string} is compressed to {CompressString(string=string).compress()}')


if __name__ == '__main__':
	strings = [x.strip() for x in sys.argv[1].split(',')]
	for word in strings:
		print_compress_string(word)
