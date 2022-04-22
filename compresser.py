def encode(string):
    compressed_string = []
    current_length = 1
    previous_index = 0
    jump = 1

    for i in range(1, len(string)):
        current_char = string[i]
        previous_char = string[previous_index]
        if current_char.isdigit():
            jump += 1
            continue
        else:
            reset_jump = True

        if current_char != previous_char:
            append_character(current_length, previous_char, compressed_string)
            current_length = 0

        current_length += 1
        previous_index += 1 if jump == 1 else + jump
        if reset_jump:
            jump = 1

    append_character(current_length, string[len(string) - 1], compressed_string)
    return "".join(compressed_string)


def append_character(length, character, encoded_string):
    if length == 1:
        encoded_string.append(character)
    else:
        encoded_string.append(character)
        encoded_string.append(str(length))


def test_encode(string, result):
    assert encode(string) == result


test_encode("aaabccccdd", "a3bc4d2")
test_encode("aaaaaffffffffffc", "a5f10c")
test_encode("abcd", "abcd")
test_encode("ccceee12eccceee", "c3e4c3e3")
test_encode("effeac01cb65c", "effeac01cb65c")
test_encode("", "")
test_encode("  ", "  ")