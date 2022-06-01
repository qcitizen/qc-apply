import unittest

from compress import compress


class TestCompressScript(unittest.TestCase):

    def test_compress(self):
        self.assertEqual(
            compress('aaabccccdd', case_flag=True), 'a3bc4d2'
        )
        self.assertEqual(
            compress('aaaaaffffffffffc', case_flag=True), 'a5f10c'
        )
        self.assertEqual(
            compress('abcd', case_flag=True), 'abcd'
        )
        self.assertEqual(
            compress('ccceee12eccceee', case_flag=True), 'c3e4c3e3'
        )
        self.assertEqual(
            compress('effeac01cb65c', case_flag=True), 'ef2eac2bc'
        )


if __name__ == '__main__':
    unittest.main()
