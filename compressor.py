# Ben Gelhard QC submission

def compressor(org_str):
  
  if len(org_str) == 0: # returning nothing if input is empty
        return ""
  
  # setting variables and creating output string to build upon
  curr_char = ''
  streak = 1
  short_str = ""
  
  # looping through each char in string, ignoring non alpha characters 
   for c in org_str:
        if c.isalpha():
          
            # first alpha character found
            if curr_char == '': 
                curr_char = c
                short_str += c
                
            # same as current streak
            elif c == curr_char: 
                streak +=1
             
            # streak of length 1 ends
            elif streak == 1: 
                short_str += c
                curr_char = c
                
            # streak > 1 ends
            else:             
                short_str += str(streak) + c
                streak = 1
                curr_char = c
    
    # adds number of final letter
    if streak > 1:
        short_str += str(streak)
    
    return (short_str)
  
  
#function to test cases
def test():
  
  # Test 1
  print("Test 1: aaabccccdd -> a3bc4d2")
  test_val = compressor("aaabccccdd ")
  if test_val != "a3bc4d2":
    print("Incorrect, your output was:" + test_val)
  else:
    print("Correct")
  print()
          
  # Test 2
  print("Test 2: aaaaaffffffffffc -> a5f10c")
  test_val = compressor("aaaaaffffffffffc")
  if test_val != "a5f10c":
    print("Incorrect, your output was:" + test_val)
  else:
    print("Correct")
  print()
   
  # Test 3        
  print("Test 3: abcd -> abcd")
  test_val = compressor("abcd")
  if test_val != "abcd":
    print("Incorrect, your output was:" + test_val)
  else:
    print("Correct")
  
test()
  
