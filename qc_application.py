def collapse_alpha_numeric_stirng(an_input):

    if len(an_input) == 1:
        return an_input

    consecutive_letters = []
    output = ""

    for i in an_input:

        try:
            int(i)
            continue
        except ValueError:
            pass

        if len(consecutive_letters) == 0:
            consecutive_letters.append(i)

        else:

            if i == consecutive_letters[0]:
                consecutive_letters.append(i)
    
            else:
                if len(consecutive_letters) == 1:
                    output += consecutive_letters[0]
                else:
                    output += consecutive_letters[0] + str(len(consecutive_letters))

                consecutive_letters = [i]
              
    if len(consecutive_letters) == 1:
        output += consecutive_letters[0]
    else:
        output += consecutive_letters[0] + str(len(consecutive_letters))

    return(output)
                

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

