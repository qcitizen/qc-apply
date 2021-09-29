new_list = []

my_string = input("Enter a string: ")
x = ''.join(sorted(set(my_string), key=my_string.index))
test_str = my_string

for i in x:
    counter = test_str.count(i)
    if i == ' ':
        i = 'Space'
    if counter == 1:
	    counter = ''
    new_list.append(i + str(counter))
print("final result: %s "%(''.join(new_list)))
