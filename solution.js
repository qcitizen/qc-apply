let strCompression = (str) => {
  let output = "";
  for (let i = 0; i < str.length; i++) {
    // stores current letter
    let currentLetter = str[i];
    let count = 1;
    // checks if next letter is same as current letter
    while (str[i + 1] === currentLetter) {
      count++;
      i++;
    }
    // condition to not display single letter number i.e. 1
    if (count === 1) {
      output += currentLetter;
    } else {
      output += currentLetter + count;
    }
  }
  return output;
}

console.log(strCompression("aaabccccdd"));
console.log(strCompression("aaaaaffffffffffc"));
console.log(strCompression("abcd"));
console.log(strCompression("ccceee12eccceee"));
console.log(strCompression("effeac01cb65c"));