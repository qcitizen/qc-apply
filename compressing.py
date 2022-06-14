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


def compress(input_str):
    ...


if __name__ == '__main__':
    logger.info('Run tests')
    _test()
