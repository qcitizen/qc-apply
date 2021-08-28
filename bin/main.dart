import 'dart:io';
import 'package:qc_apply/qc_apply.dart' as qc_apply;

void main(List<String> arguments) {
  print(
    'Enter your alphanumeric string:',
  );

  String? initial = stdin.readLineSync(
    retainNewlines: true,
  );

  print(
    qc_apply.compressStr(initial),
  );
}
