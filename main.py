from collections import defaultdict


def compress(message: str) -> str:
    """Compress an alphanumeric  by collapsing consecutive values.

    Args:
        message: The message to compress

    Returns:
        str: The compressed message

    >>> compress('aaabccccdd')
    a3bc4d2
    >>> compress('aaaaaffffffffffc')
    a5f10c
    """
    letter_counts = defaultdict(int)
    letter_order = ""
    for letter in message:
        if not letter.isdigit():
            letter_counts[letter] += 1

            if letter not in letter_order:
                letter_order += letter

    compressed_message = ""
    for letter in letter_order:
        letter_count = letter_counts.get(letter)

        if not letter_count:
            raise ValueError('Invalid letter')

        compressed_message += f'{letter}{letter_count}' if letter_count > 1 else letter

    return compressed_message
