/*
 * Author: Aaron Surty
 * A utility that compresses a string of letters from the alphabet (upper or lower case) by collapsing consecutive characters.  The result of a compress/decompress would result in the loss of numbers.
 * Input : String (input) - an alphanumeric string
 * Output : String - the compressed string with numbers representing how many adjacent consecutive characters there are
 */
String compressAlphaNumeric(String input) {
  if(input.length==0) return input;

  input = input.replaceAll(RegExp(r'[^a-zA-Z]*'), '');

  String result = '';
  String previousChar = input[0];
  int consecutiveCharCount = 1;
  int currentIndex = 1;

  void doAppend() {
      result += previousChar;
      if(consecutiveCharCount > 1) {
        result += consecutiveCharCount.toString();
      }
  }

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

  doAppend();

  return result;

}
