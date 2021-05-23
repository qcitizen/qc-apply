"""
    Matthew Parrotta
    Qualified Citizen Application
    Senior Fullstack Developer
    05/23/21
"""


"""
    This function takes an alpha numeric string and compresses it per implementation specifications
    INPUT: An alpha numeric string
    OUTPUT: The compressed string
"""

def collapse_alpha_numeric_stirng(an_input):

    #Base case of a string with length 1
    if len(an_input) == 1:
        return an_input

    consecutive_letters = []
    output = ""

    for i in an_input:

        #Try to type cast character as int, if this works we know the character is an int and we pass it
        try:
            int(i)
            continue
        except ValueError:
            pass
        
        #Ensure the first character of the string is added to the list
        if len(consecutive_letters) == 0:
            consecutive_letters.append(i)

        else:

            #Append consecutive letters
            if i == consecutive_letters[0]:
                consecutive_letters.append(i)
    
            #Append to output. If it is a single character, do not include the number of repitions
            else:
                if len(consecutive_letters) == 1:
                    output += consecutive_letters[0]
                else:
                    output += consecutive_letters[0] + str(len(consecutive_letters))

                consecutive_letters = [i]
    
    #Append the final list of consecutive letters to output outside of loop
    if len(consecutive_letters) == 1:
        output += consecutive_letters[0]
    else:
        output += consecutive_letters[0] + str(len(consecutive_letters))

    return(output)
                

"""
    Test cases for application
"""
example_1 = collapse_alpha_numeric_stirng("aaabccccdd")
print(example_1)

example_2 = collapse_alpha_numeric_stirng("aaaaaffffffffffc")
print(example_2)

example_3 = collapse_alpha_numeric_stirng("abcd")
print(example_3)

example_4 = collapse_alpha_numeric_stirng("ccceee12eccceee")
print(example_4)

example_5 = collapse_alpha_numeric_stirng("effeac01cb65c")
print(example_5)

example_6 = collapse_alpha_numeric_stirng("mattisagoodprogrammer")
print(example_6)

