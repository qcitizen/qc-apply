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