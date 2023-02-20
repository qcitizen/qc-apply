from compress import compress


def test_one():
    assert compress("AABBCC") == "A2B2C2"


def test_two():
    assert compress("aaabccccdd") == "a3bc4d2"


def test_three():
    assert compress("aaaaaffffffffffc") == "a5f10c"


def test_four():
    assert compress("abcd") == "abcd"


def test_five():
    assert compress("ccceee12eccceee") == "c3e4c3e3"


def test_six():
    assert compress("effeac01cb65c") == "ef2eac2bc"
