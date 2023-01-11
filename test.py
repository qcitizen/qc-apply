from main import compress


def test_compress():
    result = compress('aaabccccdd')
    assert result == 'a3bc4d2'

    result = compress('aaaaaffffffffffc')
    assert result == 'a5f10c'

    result = compress('abcd')
    assert result == 'abcd'

    result = compress('ccceee12eccceee')
    assert result == ('c3e4c3e3')

    result = compress('effeac01cb65c')
    assert result == 'ef2eac2bc'


if __name__ == '__main__':
    test_compress()
