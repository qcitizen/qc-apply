def compress_string(string: str) -> str:
    """
    Function which takes a string and then compresses it.
    """
    
    # intialise vairables
    count = 1
    compressed_string = ""
    
    letters = [char for char in string if char.isalpha()]  # remove all digits from the string
    letters = "".join(letters)

    for char in range(len(letters)):

        if char + 1 > len(letters) - 1:  # check to make sure that the range is not out of index
            if count != 1:
                compressed_string = compressed_string + letters[char] + str(count)
            else:
                compressed_string += letters[char]
            break

        if letters[char] == letters[char + 1]:  # if the current character is equal to the next character, increment the counter
            count += 1

        elif count > 1:  # add the count plus the current character to the string
            compressed_string = compressed_string + letters[char] + str(count)
            count = 1

        elif count == 1:  # add only the current character to the string
            compressed_string += letters[char]

    return compressed_string

# The time complexity of this algorithm is big O of n while the space complexity is also big O of n.


