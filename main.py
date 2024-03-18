import unittest


def compress(input_str: str) -> str:
    """
    Compresses the input string by replacing repeated characters with the character followed by the count of the
    repetitions. Characters that do not repeat will not be followed by the count of repetitions. Additionally, the
    function will strip numbers and special characters from the input string.
    :param input_str: The string to be compressed.
    :return: The compressed string.
    """

    if not isinstance(input_str, str):
        raise TypeError("Invalid input type. Expected a string.")

    if not input_str:
        return ""

    result = ""
    count = 1
    prev_char = input_str[0]
    working_str = input_str + 'a'  # Sentinel character to ensure the last character is processed

    for char in working_str[1:]:
        if not char.isalpha():
            continue

        if char == prev_char:
            count += 1
        else:
            result += prev_char if count == 1 else prev_char + str(count)
            prev_char = char
            count = 1

    return result


class TestCompress(unittest.TestCase):
    def test_compress(self):
        self.assertEqual(compress('aaabccccdd'), 'a3bc4d2')
        self.assertEqual(compress('aaaaaffffffffffc'), 'a5f10c')
        self.assertEqual(compress('abcd'), 'abcd')
        self.assertEqual(compress('ccceee12eccceee'), 'c3e4c3e3')
        self.assertEqual(compress('effeac01cb65c'), 'ef2eac2bc')
        self.assertEqual(compress('ef#fea$$c01cb/&@65c'), 'ef2eac2bc')

    def test_compress_empty_string(self):
        self.assertEqual(compress(''), '')

    def test_compress_invalid_input(self):
        with self.assertRaises(TypeError):
            compress(345)


if __name__ == "__main__":
    unittest.main()
