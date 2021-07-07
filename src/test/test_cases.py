import pytest
from compress import CompressString


@pytest.mark.parametrize("string, expected_result",
                         [("aaabccccdd", "a3bc4d2"), ("aaaaaffffffffffc", "a5f10c"), ("abcd", "abcd"),
                          ("ccceee12eccceee", "c3e4c3e3"), ("effeac01cb65c", "ef2eac2bc"), ("", ""),
                          ("12345667890", "")])
def test_use_cases(string, expected_result):
	result = CompressString(string=string).compress()
	assert result == expected_result


@pytest.mark.parametrize("letter, expected_value", [('a', True), ('', False), ('1', False)])
def test_is_letter(letter, expected_value):
	result = CompressString(letter=letter)._is_letter()
	assert result == expected_value


@pytest.mark.parametrize("compression, letter, expected_value",
                         [('a', 'a', True), ('', 'b', False), ('a1', 'a', False)])
def test_is_previous_letter_same(compression, letter, expected_value):
	result = CompressString(compression=compression, letter=letter)._is_previous_letter_same()
	assert result == expected_value


@pytest.mark.parametrize("compression, letter, expected_value", [('a', 'a', 'aa'), ('a', '2', 'a2')])
def test_add_letter(compression, letter, expected_value):
	compress = CompressString(compression=compression, letter=letter)
	compress._add_letter()
	assert compress.compression == expected_value


@pytest.mark.parametrize("compression, count, expected_value", [('a', '1', 'a1'), ('a', '21', 'a21')])
def test_add_count(compression, count, expected_value):
	compress = CompressString(compression=compression, count=count)
	compress._add_count()
	assert compress.compression == expected_value


@pytest.mark.parametrize("count, expected_value", [(1, 2), (44, 45)])
def test_increment_count(count, expected_value):
	compress = CompressString(count=count)
	compress._increment_count()
	assert compress.count == expected_value


@pytest.mark.parametrize("count ", [(22), (33)])
def test_reset_count(count):
	compress = CompressString(count=count)
	compress._reset_count()
	assert compress.count == 0
