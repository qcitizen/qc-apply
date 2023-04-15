import sys

def strip_digits(string: str):
    "Strips away chars that are digits."
    return ''.join(list(map(lambda c: '' if c.isdigit() else c, string)))



def main():
    # provide string as an argument to the script
    string = sys.argv[1]
    num_stripped = strip_digits(string)
    print(num_stripped)

main() 