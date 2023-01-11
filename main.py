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
    previous_letter = None
    compressed_message = ""
    for letter in message:
        if letter.isdigit():
            continue

        if previous_letter and previous_letter != letter:
            current_letter_count = letter_counts.get(previous_letter, 0)
            compressed_message += f'{previous_letter}{current_letter_count}' if current_letter_count > 1 else previous_letter
            del letter_counts[previous_letter]

        letter_counts[letter] += 1
        previous_letter = letter

    compressed_message += f'{previous_letter}{letter_counts.get(letter)}' if letter_counts.get(letter) > 1 else previous_letter

    return compressed_message
