// To run copy & paste the complete file to https://dartpad.dev and run.
// to see the result look for consloe in the bottom left corner.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

 String textCompressingAlgo(String inputString01) {

  //  Check Whether String is EMPTY or not
  if(inputString01.isEmpty) {
    return "Nothing is available to compress";
  } else{
    
    // Convert all the characters to lowercase to make it case insensitive
    String _convertToLowerCase = inputString01.toLowerCase();

    // This will remove all the white spaces.
    String _removeSpaces = _convertToLowerCase.replaceAll(' ','');

    // Remove all the numbers from the String refer to example 04
    String _removeNumbers = _removeSpaces.replaceAll(RegExp('[0-9]'),'');

    // 0 is added at the end to avoid non counting of last character of the input string.
    String _toBeConvertedString = _removeNumbers + '0';

    // String is converted to characters to make it easy for comparision.
    Characters _finalCharacters = _toBeConvertedString.characters;

    // Hold the value of how many times character is repeated, initially set to 01
    int _noOfTimesRepeated = 1;

    // Final result of the alpha numeric compression.
    String _finalCompressedString = '';

    // This bool is helping in running the else loop properly.
    bool _lastSame = false;

    // Holds the value of last character to compare with the new one.
    String _lastCharacter = '';

    for( var element in _finalCharacters) {
      if(element == _lastCharacter) {
        // This will continues as long as the character repeats.
        // Increases the repeatation by 01 every time it runs.
        _lastCharacter = element;
        _noOfTimesRepeated++;
        _lastSame = true;
      } else{
          if(_lastSame) {
            // adds the text to finalCompressedString if it repeats for more than one time.
            _finalCompressedString = _finalCompressedString + _lastCharacter + _noOfTimesRepeated.toString();
            //FUN01 Changes the default of place holders. 
            _lastCharacter = element;
            _noOfTimesRepeated = 1;
            _lastSame = false;
          } else{
            // adds the text to finalCompressedString if it not repeats.
            _finalCompressedString = _finalCompressedString + _lastCharacter;
            // in regular apps below 03 setters and FUN01 above could be called in single 
            //void function to avoid repetition.
            _lastCharacter = element;
            _noOfTimesRepeated = 1;
            _lastSame = false;
          }
          
        }
      }

    return _finalCompressedString;
  }

  }

  //   Change the text to inside textChangingAlgo and see the results in console.
  String _convertedText = textCompressingAlgo('aaabcCDcdd00');
  print('CompressedString');
  print(_convertedText);
  print(' ');

  //unit tests for different types start here.
  // For Example 01
  test('Test for case 01', () {
    String _toConvertString = 'aaabccccdd';
    String _correctOutput = textCompressingAlgo(_toConvertString);

    expect(_correctOutput, 'a3bc4d2');
  });
  
  // For example 04
  test('Test for case 04 - remove numbers', () {
    String _toConvertString = 'ccceee12eccceee';
    String _correctOutput = textCompressingAlgo(_toConvertString);

    expect(_correctOutput, 'c3e4c3e3');
  });
}
