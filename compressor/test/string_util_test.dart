import 'package:test/test.dart';
import 'package:compressor/string_util.dart';

void main() {
  test('accepts an empty string and returns the empty string', () {
    expect(compressAlphaNumeric(''), equals(''));
  });

  test('accepts a string of letters without consecutive values and returns back the same string', () {
    expect(compressAlphaNumeric('abc'), equals('abc'));
  });

  test('removes numbers', () {
    expect(compressAlphaNumeric('a43b1c30'), equals('abc'));
  });

}
