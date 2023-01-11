from main import compress


def test_compress():
    actual = compress('aaabccccdd')
    expected = 'a3bc4d2'
    try:
        assert actual == expected
    except AssertionError as error:
        print(f'Error: expected {expected} but actual was {actual}')

    actual = compress('aaaaaffffffffffc')
    expected = 'a5f10c'
    try:
        assert actual == expected
    except AssertionError as error:
        print(f'Error: expected {expected} but actual was {actual}')

    actual = compress('abcd')
    expected = 'abcd'
    try:
        assert actual == expected
    except AssertionError as error:
        print(f'Error: expected {expected} but actual was {actual}')

    actual = compress('ccceee12eccceee')
    expected = 'c3e4c3e3'
    try:
        assert actual == expected
    except AssertionError as error:
        print(f'Error: expected {expected} but actual was {actual}')

    actual = compress('effeac01cb65c')
    expected = 'ef2eac2bc'
    try:
        assert actual == expected
    except AssertionError as error:
        print(f'Error: expected {expected} but actual was {actual}')


if __name__ == '__main__':
    test_compress()
