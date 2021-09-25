# String Compressor

A utility that compresses an alphanumeric string by collapsing consecutive characters.  The result of a compress/decompress would result in the loss of numbers.


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

## Algo Description

1.  Remove all numbers
  a. Use a regex to match numbers and replace them with an empty string

2.  Collapse consecutive characters
  a. Initialize some temp variables
    i ) Create an empty list that will be the final result
    ii ) A count for consecutive characters (equals 1)
    iii ) A string for the current character (equals first char in 'input')
  b. starting with the second character compare it with the current character
  c. if it is the same then increment the count and go to the next
  d. if it is different then append the current character to the result,
     append the count if is greater than 1,
     reset the count to 1 and current character
  e. stop once the end of the string is reached

### Compexity

Time - O(n)
Space - O(n)

## Edge Cases

  * handles empty strings

  * handles non alphanumeric characters

  * does not accept null as dart is running with null safety


## Timeboxing

Try to complete this task within 30 minutes.


## What we look for

- Code structure — specifically how readable and understandable it is
    - (Optional) Consider using of whitespace and inline doc strings for clarity
- Git usage — granularity of commits and any branches or tags
- Edge cases — how they're handled so they won't be forgotten
    - (Optional) Describe or implement a solution for each case (if any)
- Bonus: Add a very basic test for each case


## What we _don't_ look for

- Language — use whatever programming language you're most comfortable with
- Number of lines — it can be any length as long as it's readable and understandable
- Time spent — just be honest and tell us how you used the time


## How to submit

1. Fork this repo to a public one on your account.
2. Add an empty file for your code and make a commit.
3. Make granular commits as you go so that each one is readible with an accurate commit message.
4. When you're done, submit your fork as a pull request back to this repo.
5. To help us stay organized, please email us at careers@quantifiedcitizen.com with the link and a few details about your experience and/or interest in working with us.
