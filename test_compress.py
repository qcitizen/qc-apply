
from argparse import Namespace
import unittest

from compress import compress, main


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

    def test_infile_outfile(self):
        args = Namespace(
            case_flag=True, infile='input_strings.text', outfile='output.text'
        )
        main(args)

        with open('output.text') as f:
            data = f.readlines()

        self.assertEqual((data[0].strip()), 'a3bc4d2')
        self.assertEqual(data[1].strip(), 'a5f10c')
        self.assertEqual(data[2].strip(), 'abcd')
        self.assertEqual(data[3].strip(), 'c3e4c3e3')
        self.assertEqual(data[4].strip(), 'ef2eac2bc')

    def test_case_flag(self):
        self.assertEqual(
            compress('ccceee12eccceee', case_flag=True), 'c3e4c3e3'
        )
        self.assertEqual(
            compress('cCCeEe12eccCEee', case_flag=False), 'c3e4c3e3'
        )
        self.assertEqual(
            compress('cCCeEe12eccCEEe', case_flag=True), 'cC2eEe2c2CE2e'
        )


if __name__ == '__main__':
    unittest.main()
