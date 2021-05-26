let strCompression = (str) => {
  // removes number from input string
  let noNumStr = str.replace(/[0-9]/g, '');
  let output = "";

  for (let i = 0; i < noNumStr.length; i++) {
    // stores current letter
    let currentLetter = noNumStr[i];
    let count = 1;

    // checks if next letter is same as current letter
    while (noNumStr[i + 1] === currentLetter) {
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

let testCase = (input, output) => {
  if (strCompression(input) === output) {
    console.log("✅ All Tests Passed ✅");
  } else {
    console.log("❌ Test Fail ❌");
  }
}

testCase("aaabccccdd", "a3bc4d2");
testCase("aaaaaffffffffffc", "a5f10c");
testCase("abcd", "abcd");
testCase("ccceee12eccceee", "c3e4c3e3");
testCase("effeac01cb65c", "ef2eac2bc");