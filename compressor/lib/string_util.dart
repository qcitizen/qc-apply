/*
 * Author: Aaron Surty
 * A utility that compresses a string of letters from the alphabet (upper or lower case) by collapsing consecutive characters.  The result of a compress/decompress would result in the loss of non alphabetic characters.
 * Input : String (input) - a string of upper/lower case characters from the alphabet.
 * Output : String - the compressed string with numbers representing how many adjacent consecutive characters there are
 * The string is treated as case sensitve (ie/ input aAbb output aAb2 )
 */
String compressAlphabetic(String input) {
  if(input.length==0) return input;

  input = input.replaceAll(RegExp(r'[^a-zA-Z]*'), '');

  // init working vars
  String result = '';
  String previousChar = input[0];
  int consecutiveCharCount = 1;
  int currentIndex = 1;

  // appends current char to result
  void doAppend() {
      result += previousChar;  // Assuming string concat is amortized to O(1)
      if(consecutiveCharCount > 1) {
        result += consecutiveCharCount.toString();
      }
  }

  // iterates over each next char
  while(currentIndex < input.length) {
    if(previousChar!=input[currentIndex]) {
      doAppend();
      consecutiveCharCount = 1;
      previousChar = input[currentIndex];
    } else {
      consecutiveCharCount++;
    }
    currentIndex++;
  }

  // calls append one last time to handle last char
  doAppend();

  return result;

}
