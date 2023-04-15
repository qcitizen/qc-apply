import sys

def strip_digits(string: str):
    "Strips away chars that are digits."
    return ''.join(list(map(lambda c: '' if c.isdigit() else c, string)))

def compress_chars(string: str):
    "Squash repetitive chars and add consequent count."
    result_str = ''
    previous = None
    counter = 1
    for i, c in enumerate(string):
        if c == previous:
            counter += 1
            if i == (len(string) - 1):
                result_str += str(counter)
            continue
        else:
            if counter > 1:
                result_str += str(counter)
            result_str += c
            counter = 1
        previous = c 
    return result_str


def main():
    # provide string as an argument to the script
    string = sys.argv[1]
    num_stripped = strip_digits(string)
    print(num_stripped)
    compressed = compress_chars(num_stripped)
    print(compressed)

main() 