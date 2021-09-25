# String Compressor

A utility that compresses an alphanumeric string by collapsing consecutive characters.  The result of a compress/decompress would result in the loss of numbers or any character that is not part of the latin alphabet.

The rules of the compression algorithm are defined by the test cases below.

## Test cases

Each item below has an input value and the expected output from the function.

1. `aaabccccdd` → `a3bc4d2`
2. `aaaaaffffffffffc` → `a5f10c`
3. `abcd` → `abcd` (note: not `a1b1c1d1`)
4. `ccceee12eccceee` → `c3e4c3e3` (numbers removed)
5. `effeac01cb65c` → `ef2eac2bc`

## Testing

  ```
    $ cd compressor; dart test
  ```

## Assumptions

1.  Since the exercise description mentioned that the method should take alphanumeric characters and remove numbers, assume other symbols and other non alphabetic characters should also be removed.

## Algo Description

1.  Remove all non alphabetic characters.
  a. Use a regex to match non alphabetic characters and replace them with an empty string.

2.  Collapse consecutive characters

  a. Initialize some temp variables
    i ) Create an empty list that will be the final result
    ii ) A count for consecutive characters (equals 1)
    iii ) A string for the current character (equals first char in 'input')
    iv ) the current index to compare

  b. starting with the second character compare it with the current character
    i ) if it is the same then increment the count and go to the next

    ii ) if it is different then append the current character to the result,
        append the count if is greater than 1,
        reset the count to 1,
        and set current character to the next character since it was not a match

  e. stop once the end of the string is reached

### Compexity

Time - O(n)
Space - O(n)

## Edge Cases

  * handles empty strings

  * handles non alphanumeric characters

  * does not accept null as dart is running with null safety


## Timeboxing

This exercise took roughly 1 hr and 15 min. for me to complete.  In the future I might improve on the time with the following adjustments :

1.  Walk through the steps of the propose method with a few samples before writing the implementation.

2.  Create some boiler plate for starting a project with a simple function and 'test' dir already set up.

3.  Limit scope.

  * use simple assert instead of 'dart test'

  * reduce documentation

4.  Limit distractions.

