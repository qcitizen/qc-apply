import 'package:qc_apply/qc_apply.dart';
import 'package:test/test.dart';

void main() {
  Map<String, String> _exampleStrings = {
    'aaabccccdd': 'a3bc4d2',
    'aaaaaffffffffffc': 'a5f10c',
    'abcd': 'abcd',
    'ccceee12eccceee': 'c3e4c3e3',
    'effeac01cb65c': 'ef2eac2bc',
  };

  test('Example strings check', () {
    _exampleStrings.forEach((e1, e2) {
      String? result = compressStr(e1);
      expect(
        result,
        e2,
      );
    });
  });

  test('Compressed String doesn\'t contain 1s', () {
    String? result = compressStr('abcd');
    expect(
      result!.contains('1'),
      false,
    );
  });

  group('Edge cases', () {
    test('compressStr returns null if it receives null', () {
      String? result = compressStr(null);
      expect(
        result,
        null,
      );
    });

    test('compressStr receives special chars', () {
      String? result = compressStr('-<yyy&777wer=++^#');
      expect(
        result,
        'y3wer',
      );
    });

    test('compressStr returns empty String if it receives empty String', () {
      String? result = compressStr('');
      expect(
        result,
        '',
      );
    });
  });
}
