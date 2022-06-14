import logging


logging.basicConfig(
    format=f'%(asctime)s %(levelname)s: %(message)s',
    level=logging.INFO,
)
logger = logging.getLogger(__name__)



def _test():
    expected = {
        'aaabccccdd': 'a3bc4d2',
        'aaaaaffffffffffc': 'a5f10c',
        'abcd': 'abcd',
        'ccceee12eccceee': 'c3e4c3e3',
        'effeac01cb65c': 'ef2eac2bc',
    }
    for input_str, expected_output in expected.items():
        output = compress(input_str)
        msg = f'Got {output} for input {input_str}, expected {expected_output}'
        assert output == expected_output, msg


def _find_first_letter(string):
    for char in string:
        if char.isalpha():
            return char


def compress(input_str):
    if not isinstance(input_str, str):
        return

    if not (cur_char := _find_first_letter(input_str)):
        return ''  # no letters in input

    output = cur_char
    counter = 1

    for char in input_str[1:]:
        if not char.isalpha():
            continue

        if char == cur_char:
            counter += 1
        else:
            cur_char = char
            if counter > 1:
                output += str(counter)
                counter = 1
            output += char

    if counter > 1:
        output += str(counter)

    return output


if __name__ == '__main__':
    logger.info('Run tests')
    _test()
    logger.info('Tests ok')
