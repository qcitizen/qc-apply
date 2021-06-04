void main() async {}

/// Compressor is the function that accepts a word [String] and returns
/// the compressed form of the word
String compressor(String word) {
  // Holds the character at index of the given word's iteration
  var char = "";

  //Hold the results which is the compressed string
  var results = "";

  // Tracks the number of times a character is found in a word
  int occurrence = 0;

  for (int i = 0; i < word.length; i++) {
    char = word[i];

    // End the loop execution if the character has initial occurrence
    if (results.characters.contains(char)) {
      continue;
    }
    // Iterate over the word and count the character's occurrences
    word.characters.forEach((element) {
      if (char == element) {
        occurrence++;
      }
    });

    //Append the character and it's occurrence to the result
    // if it has more than a single occurrence
    if (occurrence > 1)
      results += "$char$occurrence";

    // Append only the char if it has a single occurrence
    else
      results += char;
    occurrence = 0;
  }

  return results;
}

/// Util function to remove all numbers from a given word
String removeNumbers(String word) {
  //Replaces all numbers with an empty space
  //if the expression assertion passes
  return word.replaceAll(RegExp(r'\d'), "");
}
