// array of alphanumeric string pairs:
// ['input', 'expected_output']
const examples = [
  ['aaabccccdd','a3bc4d2'],
  ['aaaaaffffffffffc','a5f10c'],
  ['abcd','abcd'],
  ['ccceee12eccceee', 'c3e4c3e3'],
  ['effeac01cb65c','ef2eac2bc']
]

// qc-apply compression function
const compress = (str) => {
  let output = []
  let currentLetter = undefined
  let count = 0

  // iterate over alphanumeric characters
  str.split('').map((alphanumeric) => {
    // if alphanumeric is an integer, skip
    if(Number.isInteger(parseInt(alphanumeric))) return

    // if alphanumeric is a repeated letter, increase count
    if (currentLetter == alphanumeric) {
      count += 1
    // if alphanumeric is a new letter
    } else {
      // push the count of previous letter, if greater than 1
      if (count > 1) output.push(count)
      // set new letter
      currentLetter = alphanumeric
      // push new letter and reset count to 1
      output.push(currentLetter)
      count = 1
    }
  })

  // push final count if greater than 1
  if (count > 1) output.push(count)

  // join output into string
  return output.join('')
}

// if compression algorithm is implemented correctly,
// will return [ true, true, true, true, true ]
console.log(examples.map(i => i[1] == compress(i[0])))
