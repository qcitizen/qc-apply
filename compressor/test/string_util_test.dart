import 'package:test/test.dart';
import 'package:compressor/string_util.dart';

void main() {
  test('accepts an empty string and returns the empty string', () {
    expect(compressAlpha(''), equals(''));
  });

  test('accepts a string of letters without consecutive values and returns back the same string', () {
    expect(compressAlpha('abcd'), equals('abcd'));
  });

  test('removes numbers', () {
    expect(compressAlpha('a43b1c30'), equals('abc'));
  });

  test('replaces consecutive characters with a single character and a count', () {
    expect(compressAlpha('aaabccccdd'), equals('a3bc4d2'));
    expect(compressAlpha('aaaaaffffffffffc'), equals('a5f10c'));
  });

  test('does both removes numbers and replaces chars', () {
    expect(compressAlpha('ccceee12eccceee'), equals('c3e4c3e3'));
    expect(compressAlpha('effeac01cb65c'), equals('ef2eac2bc'));
  });

  test('handles symbols and other non alphanumeric characters', () {
    expect(compressAlpha('c{cceee12eccceee'), equals('c3e4c3e3'));
  });

}
