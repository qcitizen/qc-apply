import re

def alphanumeric_compress(text):
    # Remove all numbers
    pattern = r'[0-9]'
    string = re.sub(pattern, '', text)
    # Init vars
    res = ""
    count = 1
    # Add first character to res
    res += string[0]
    # Count alphanumeric number for every character
    for i in range(len(string)-1):
        if(string[i] == string[i+1]):
            count += 1
        else:
            if(count > 1):
                res += str(count)
            res += string[i+1]
            count = 1
    if(count > 1):
        res += str(count)
    return res

# Call function with input
print(alphanumeric_compress(input()))
