const assert = require('assert').strict;

function compress(str) {
  return str;
}

assert.equal(compress("aaabccccdd"), "a3bc4d2", "Failed for a3bc4d2");
assert.equal(compress("aaaaaffffffffffc"), "aaaaaffffffffffc", "Failed for aaaaaffffffffffc");
assert.equal(compress("abcd"), "abcd", "Failed for abcd");
assert.notEqual(compress("abcd"), "a1b1c1d1", "Failed for a1b1c1d1");
assert.equal(compress("ccceee12eccceee"), "ccceee12eccceee", "Failed for ccceee12eccceee");
assert.equal(compress("effeac01cb65c"), "effeac01cb65c", "Failed for effeac01cb65c");
