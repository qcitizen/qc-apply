const assert = require('assert').strict;

function compress(str) {
  const list = str.split('');
  let count = 1;
  let result = "";
  let last = list[0];
  for(let i = 1; i <= list.length; i++) {
    if (last == list[i]) {
      count++;
      continue;
    }

    if(count == 1){
      result += last;
    } else {
      result += last + count;
    }

    last = list[i];
    count = 1;
  }

  return result;
}

assert.equal(compress("aaabccccdd"), "a3bc4d2", "Failed for a3bc4d2");
assert.equal(compress("aaaaaffffffffffc"), "a5f10c", "Failed for aaaaaffffffffffc");
assert.equal(compress("abcd"), "abcd", "Failed for abcd");
assert.notEqual(compress("abcd"), "a1b1c1d1", "Failed for a1b1c1d1");
assert.equal(compress("ccceee12eccceee"), "c3e4c3e3", "Failed for ccceee12eccceee");
assert.equal(compress("effeac01cb65c"), "ef2eac2bc", "Failed for effeac01cb65c");
