def encode(string):
    compressed_string = []
    current_length = 1
    previous_index = 0

    for i in range(1, len(string)):
        current_char = string[i]
        previous_char = string[previous_index]

        if current_char != previous_char:
            append_character(current_length, previous_char, compressed_string)
            current_length = 0

        current_length += 1
        previous_index += 1

    return "".join(compressed_string)


def append_character(length, character, encoded_string):
    if length == 1:
        encoded_string.append(character)
    else:
        encoded_string.append(character)
        encoded_string.append(str(length))
