let strCompression = (str) => {
  let output = "";
  for(let i = 0; i < str.length; i++) {
    let currentLetter = str[i]; // stores current letter
    let count = 1;
    while(str[i+1] === currentLetter) { // checks if next letter is same as current letter
      count++;
      i++;
      }
      output += currentLetter + count;
  }
  return output;
}

console.log(strCompression("aaabccccdd"));