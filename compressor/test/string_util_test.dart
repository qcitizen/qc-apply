import 'package:test/test.dart';
import 'package:compressor/string_util.dart';

void main() {
  test('accepts an empty string and returns the empty string', () {
    expect(compressAlphaNumeric(''), equals(''));
  });

  test('accepts a string of letters without consecutive values and returns back the same string', () {
    expect(compressAlphaNumeric('abcd'), equals('abcd'));
  });

  test('removes numbers', () {
    expect(compressAlphaNumeric('a43b1c30'), equals('abc'));
  });

  test('replaces consecutive characters with a single character and a count', () {
    expect(compressAlphaNumeric('aaabccccdd'), equals('a3bc4d2'));
    expect(compressAlphaNumeric('aaaaaffffffffffc'), equals('a5f10c'));
  });

}
