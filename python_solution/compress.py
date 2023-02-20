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
    compressed_string = ""
    start = 0
    num_invalid_chars = 0
    for i in range(len(arbitrary_string)):
        if arbitrary_string[i] not in string.ascii_letters:
            num_invalid_chars += 1
            continue
        if arbitrary_string[start] == arbitrary_string[i]:
            continue
        compressed_string += arbitrary_string[start]
        count = i-start-num_invalid_chars
        if count != 1:
            compressed_string += str(count)
        start = i
        num_invalid_chars = 0
    compressed_string += arbitrary_string[start]
    count = len(arbitrary_string)-start-num_invalid_chars
    if count != 1:
        compressed_string += str(count)
    return compressed_string


def main():
    while True:
        to_compress = input("Type your text here: ")
        compressed = compress(to_compress)
        print(f"Here you go!: \"{compressed}\"")


if __name__ == "__main__":
    main()
