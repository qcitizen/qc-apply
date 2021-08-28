String? compressStr(String? initialStr) {
  if (initialStr == null) return null;

  if (initialStr == '') return '';

  Map<int, String> chars =
      initialStr.replaceAll(RegExp(r'[^a-zA-Z]'), '').split('').asMap();

  String compressedStr = '';

  int repeatCount = 1;

  chars.forEach((idx, e) {
    if (chars[idx] == chars[idx - 1]) {
      repeatCount++;
    } else {
      if (repeatCount == 1) {
        compressedStr += chars[idx].toString();
      } else {
        compressedStr += repeatCount.toString() + chars[idx].toString();
        repeatCount = 1;
      }
    }
    if (idx == chars.length - 1 && repeatCount > 1) {
      compressedStr += repeatCount.toString();
    }
  });

  return compressedStr;
}
