/**
 * Recursively processes a string to compress consecutive characters.
 *
 * @param {string} s - The string to process.
 * @param {string} prevChar - The previous character that was processed.
 * @param {number} count - The count of consecutive occurrences of `prevChar`.
 * @returns {string} - The compressed string segment.
 */
function process(s: string, prevChar: string, count: number): string {
    // Base case
    if (s.length === 0) {
        return count > 1 ? prevChar + count.toString() : prevChar;
    }

    // If the current character matches the previous one, increase count and continue
    if (s[0] === prevChar) {
        return process(s.slice(1), prevChar, count + 1);
    } else {
        // Add the previous char and its count (if > 1) to the result and reset the count
        const result = count > 1 ? prevChar + count.toString() : prevChar;
        return result + process(s.slice(1), s[0], 1);
    }
}

/**
 * Compresses an alphanumeric string by removing numbers and then collapsing consecutive values.
 *
 * @example
 * // Returns 'a3bc4d2'
 * compress('aaabccccdd');
 *
 * @param {string} input - The original input string to be compressed.
 * @returns {string} - The compressed string.
 */
function compress(input: string): string {
    // Remove numbers from the original string
    const noNumbers = input.replace(/[0-9]/g, '');

    // Start processing from the second character (because the first character initializes prevChar)
    return noNumbers[0] ? process(noNumbers.slice(1), noNumbers[0], 1) : '';
}

/**
 * Tests the compression function and logs the results along with a provided explanation.
 *
 * @example
 * // Logs:
 * // Test:  Basic compression test
 * // Compressing 'aaabccccdd' -> Expected: 'a3bc4d2', Got: 'a3bc4d2' true
 * testCompression('Basic compression test', 'aaabccccdd', 'a3bc4d2');
 *
 * @param {string} caseExplanation - A brief description or explanation of the test case.
 * @param {string} input - The string to be compressed.
 * @param {string} expected - The expected result after compression.
 */
function testCompression(caseExplanation: string, input: string, expected: string) {
    const result = compress(input);
    console.log("\nTest: ", caseExplanation)
    console.log(`Compressing '${input}' -> Expected: '${expected}', Got: '${result}'`, result === expected);
}

// Test cases
console.log('Provided test cases:');
testCompression('base case, ', 'aaabccccdd', 'a3bc4d2');
testCompression('base case 2', 'aaaaaffffffffffc', 'a5f10c');
testCompression('string with only single instance of each letter', 'abcd', 'abcd');
testCompression('string with numbers', 'ccceee12eccceee', 'c3e4c3e3');
testCompression('string with numbers 2', 'effeac01cb65c', 'ef2eac2bc');

console.log('\nAdditional test cases:');
testCompression('empty string', '', '');
testCompression('string with only one character', 'a', 'a');
testCompression('string with only one character and a number', 'a1', 'a');
testCompression('string with only numbers', '123456789', '');
testCompression('string with special characters', 'a!@aa$%b3^^bc', 'a3b2c')

