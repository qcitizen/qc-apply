const assert = require('assert').strict;
const CHAR_CODE_A = 65;
const CHAR_CODE_Z = 90;
const CHAR_CODE_a = 97;
const CHAR_CODE_z = 120;

function compress(str) {
  const list = str.split('');
  let count = 1;
  let result = "";
  let last = list[0];

  // Starting from 1 because 1st char already taken
  // as start point in above variables. Taking one
  // extra round in the end to handle a situattion
  // when consecutives happen at the end.
  for(let i = 1; i <= list.length; i++) {
    // Not handling anything out side of alphabets
    const charCode = list[i] && list[i].charCodeAt(0);
    if(charCode < CHAR_CODE_A || charCode > CHAR_CODE_z ||
        (charCode > CHAR_CODE_Z && charCode < CHAR_CODE_a)) {
      continue;
    }

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
