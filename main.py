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

        print(f'letter: {letter}')
        print(f'previous letter: {previous_letter}')
        if previous_letter and previous_letter != letter:
            print(f'new letter appearing: {letter}')
            current_letter_count = letter_counts.get(previous_letter, 0)
            compressed_message += f'{previous_letter}{current_letter_count}' if current_letter_count > 1 else previous_letter
            del letter_counts[previous_letter]
            letter_counts[letter] += 1
        else:
            # previous_letter is equivalent to letter
            letter_counts[letter] += 1
            print(f'appending letter to count: {letter_counts.get(letter)}')

        previous_letter = letter

    print(f'last letter: {previous_letter}')
    print(f'last letter count: {letter_counts.get(letter)}')
    compressed_message += f'{previous_letter}{letter_counts.get(letter)}' if current_letter_count > 1 else previous_letter

    return compressed_message
