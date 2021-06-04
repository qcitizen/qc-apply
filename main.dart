void main() async {}

/// Util function to remove all numbers from a given word
String removeNumbers(String word) {
  //Replaces all numbers with an empty space
  //if the expression assertion passes
  return word.replaceAll(RegExp(r'\d'), "");
}
