import logging


logging.basicConfig(
    format=f'%(asctime)s %(levelname)s: %(message)s',
    level=logging.INFO,
)
logger = logging.getLogger(__name__)



def _test():
    ...


def compress():
    ...


if __name__ == '__main__':
    logger.info('Run tests')
    _test()
