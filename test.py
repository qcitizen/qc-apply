import unittest
from main import strip_digits, compress_chars

class TestCompression(unittest.TestCase):

    def test_digit_removal(self):
        data = '123ay45uer3824asfe45rde'
        result = strip_digits(data)
        self.assertEqual('ayuerasferde', result, 'improperly implemented')

    def test_compression_simple(self):
        data = 'ayyyyuiiipoprttsq'
        result = compress_chars(data)
        self.assertEqual('ay4ui3poprt2sq', result, 'improperly implemented')

    def test_compression_edge(self):
        data = 'ayyyyuiiipoprttsqqqq'
        result = compress_chars(data)
        self.assertEqual('ay4ui3poprt2sq4', result, 'improperly implemented')

if __name__ == '__main__':
    unittest.main()