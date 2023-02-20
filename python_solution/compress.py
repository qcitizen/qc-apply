#!/bin/python3
# Author: Ethan Hindmarsh <ethan@ethan.lol>

# Copied from rust solution:
# Plan:
# 1. Take in a string
# 2. Have two pointers within the string,
#    one for the start of each unique character
#    one to iterate until the end of that character
#    (eg. for string aaaabbbbbccccc, the first pointer
#    would be at     ^
#    and the second at  ^ (the first a, and ends at the last a))
# 3. Add the character to the output string
# 4. Add the number of occurances of that character to the output string
#    Can be calculated by the index of the second pointer minus the index of
#    the first
# 5. Repeat until the end of the string
import string


def compress(arbitrary_string: str):
    pass


def main():
    while True:
        to_compress = input("Type your text here: ")
        compressed = compress(to_compress)
        print(f"Here you go!: \"{compressed}\"")


if __name__ == "__main__":
    main()
