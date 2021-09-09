import 'package:flutter/material.dart';

void main() {
  

 String textCompressingAlgo(String inputString01) {

  //  Check Whether String is EMPTY or not
  if(inputString01.isEmpty) {
    return "Nothing is available to compress";
  } else{
    
    // Convert all the characters to lowercase to make it case insensitive
    String _convertToLowerCase = inputString01.toLowerCase();
    // Remove all the numbers from the String refer to example 04
    String _removeNumbers = _convertToLowerCase.replaceAll(RegExp('[0-9]'),'');

    return _removeNumbers;
  }
  
  }

  //   Change the text to inside textChangingAlgo and see the results in console.
  String _convertedText = textCompressingAlgo('aaabcCDcdd00');
  print('CompressedString');
  print(_convertedText);
  print(' ');
}
