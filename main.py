from collections import defaultdict


def formatted_letter(letter: str, count: int) -> str:
    """Format a letter with the given count if greater than 1 or else return that letter.

    Args:
        letter (str): the letter to be formatted
        count (int): the letter count

    Returns:
        str: the formatted letter
    """
    return f'{letter}{count}' if count > 1 else letter


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
        # ignore digits
        if letter.isdigit():
            continue

        # check if the letter is beginning a new sequence
        # remove current count for potential new sequence
        is_new_letter_sequence = previous_letter and previous_letter != letter
        if is_new_letter_sequence:
            current_letter_count = letter_counts.get(previous_letter)
            compressed_message += formatted_letter(previous_letter, current_letter_count)
            del letter_counts[previous_letter]

        # update the letter count and update previous_letter pointer
        letter_counts[letter] += 1
        previous_letter = letter

    # taking account for last letter sequence
    last_letter_count = letter_counts.get(letter)
    compressed_message += formatted_letter(previous_letter, last_letter_count)

    return compressed_message
