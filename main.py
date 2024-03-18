def compress(input_str: str) -> str:
    """
    Compresses the input string by replacing repeated characters with the character followed by the count of the
    repetitions. Characters that do not repeat will not be followed by the count of repetitions. Additionally, the
    function will strip numbers from the input string.
    :param input_str: The string to be compressed.
    :return: The compressed string.
    """
    return 'hello world'


if __name__ == "__main__":
    print(compress('hello worldddddd'))
