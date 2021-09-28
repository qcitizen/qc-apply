def compress(inp_str):
    '''Returns the compressed form of the string
    '''
    current_char = None
    ret_str = ''
    streak_count = 0

    for letter in inp_str:

        # If the character is not an alphabet, skip
        if not letter.isalpha():
            continue

        if current_char is None:
            current_char = letter

        # Count the longest streak
        if letter != current_char:
            ret_str += current_char
            if streak_count > 1:
                ret_str += str(streak_count)
            streak_count = 1
            current_char = letter
        else:
            streak_count += 1

    # If the string is empty or all non-alphabets, returns ''
    if streak_count == 0:
        return ''

    # Handles the last set of character(s) of the input string
    ret_str += current_char
    if streak_count > 1:
        ret_str += str(streak_count)

    return ret_str


if __name__ == "__main__":

    test_dict = {
        'characters only': ('aaabccccdd', 'a3bc4d2'),
        'test2': ('aaaaaffffffffffc', 'a5f10c'),
        'test3': ('abcd', 'abcd'),
        'test4': ('ccceee12eccceee', 'c3e4c3e3'),
        'test5': ('effeac01cb65c','ef2eac2bc')
    }

    for testname, (test_input, output) in test_dict.items():
        if output != compress(test_input):
            print(f'Test failed for {testname}. '
                  f'Expected {output} but function returned {compress(test_input)}.')
        else:
            print(f'for {testname}, '
                  f'with {test_input=}, '
                  f'we expect = {output=}.\n'
                  f'The function returns {compress(test_input)=}\n')
