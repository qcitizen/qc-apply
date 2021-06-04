void main() {
  test('Test Scenarios ', () {
    expect("abcd", removeNumbers("1242342a345b2423c234d"));
    expect("a3bc4d2", compressor("aaabccccdd"));
    expect("a5f10c", compressor("aaaaaffffffffffc"));
    expect("abcd", compressor("abcd"));
    expect("ef2eac2bc", compressor("effeac01cb65c"));
  });
}
