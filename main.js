/**
 * Recursively processes a string to compress consecutive characters.
 *
 * @param {string} s - The string to process.
 * @param {string} prevChar - The previous character that was processed.
 * @param {number} count - The count of consecutive occurrences of `prevChar`.
 * @returns {string} - The compressed string segment.
 */
function process(s, prevChar, count) {
    // Base case
    if (s.length === 0) {
        return count > 1 ? prevChar + count.toString() : prevChar;
    }
    // If the current character matches the previous one, increase count and continue
    if (s[0] === prevChar) {
        return process(s.slice(1), prevChar, count + 1);
    }
    else {
        // Add the previous char and its count (if > 1) to the result and reset the count
        var result = count > 1 ? prevChar + count.toString() : prevChar;
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
function compress(input) {
    // Remove numbers from the original string
    var noNumbers = input.replace(/[0-9]/g, '');
    // Start processing from the second character (because the first character initializes prevChar)
    return noNumbers[0] ? process(noNumbers.slice(1), noNumbers[0], 1) : '';
}
// Test cases
console.log(compress('aaabccccdd') === 'a3bc4d2');
console.log(compress('aaaaaffffffffffc') === 'a5f10c');
console.log(compress('abcd') === 'abcd');
console.log(compress('ccceee12eccceee') === 'c3e4c3e3');
console.log(compress('effeac01cb65c') === 'ef2eac2bc');
