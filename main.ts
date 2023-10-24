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

function compress(input: string): string {
    // Remove numbers from the original string
    const noNumbers = input.replace(/[0-9]/g, '');

    // Start processing from the second character (because the first character initializes prevChar)
    return noNumbers[0] ? process(noNumbers.slice(1), noNumbers[0], 1) : '';
}

// Test cases
console.log(compress('aaabccccdd') === 'a3bc4d2');
console.log(compress('aaaaaffffffffffc') === 'a5f10c');
console.log(compress('abcd') === 'abcd');
console.log(compress('ccceee12eccceee') === 'c3e4c3e3');
console.log(compress('effeac01cb65c') === 'ef2eac2bc');