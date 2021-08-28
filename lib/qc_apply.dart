String? compressStr(String? initialStr) {
  if (initialStr == null) return null;

  if (initialStr == '') return '';

  Map<int, String> _chars =
      initialStr.replaceAll(RegExp(r'[^a-zA-Z]'), '').split('').asMap();

  String _compressedStr = '';

  int _repeatCount = 1;

  _chars.forEach((idx, e) {
    if (_chars[idx] == _chars[idx - 1]) {
      _repeatCount++;
    } else {
      if (_repeatCount == 1) {
        _compressedStr += _chars[idx].toString();
      } else {
        _compressedStr += _repeatCount.toString() + _chars[idx].toString();
        _repeatCount = 1;
      }
    }
    if (idx == _chars.length - 1 && _repeatCount > 1) {
      _compressedStr += _repeatCount.toString();
    }
  });

  return _compressedStr;
}
