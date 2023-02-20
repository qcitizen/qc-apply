use clap::Parser;

#[derive(Parser, Debug)]
#[command(author, version, about, long_about = None)]
struct Args {
    /// Some Arbitrary String
    #[arg(short, long)]
    arbitrary_string: String,
}

fn _append_to_output(output: &mut String, char: char, count: usize) {
    println!("Appending {} to output", char);
    println!("Count: {}", count.to_string());
    output.push_str(&char.to_string());
    if count != 1 {
        output.push_str(&count.to_string());
    }
}

// Plan:
// 1. Take in a string
// 2. Have two pointers within the string,
//    one for the start of each unique character
//    one to iterate until the end of that character
//    (eg. for string aaaabbbbbccccc, the first pointer
//    would be at     ^
//    and the second at  ^ (the first a, and ends at the last a))
// 3. Add the character to the output string
// 4. Add the number of occurances of that character to the output string
//    Can be calculated by the index of the second pointer minus the index of the first
// 5. Repeat until the end of the string
fn string_to_compressed_string(working_str: Vec<char>) -> String {
    let mut output: String = "".to_string();
    let mut idx_one: usize = 0;
    let mut idx_two: usize = 0;
    let mut numeric_count: usize = 0; // To subtract characters that are numeric

    while idx_two != working_str.len() {
        if working_str[idx_one] == working_str[idx_two] {
            idx_two += 1;
            continue;
            // Continue until we've found a different char or we're at the end
        } else if working_str[idx_two].is_numeric() {
            // We could test for is_not_alphabetic and that would catch most all edge cases, but
            // I'm happy living in fantasy world where I can assume that the input is only alphanumeric
            // Ignore and continue
            numeric_count += 1;
            idx_two += 1;
            continue;
        }
        _append_to_output(
            &mut output,
            working_str[idx_one],
            idx_two - idx_one - numeric_count,
        );

        // Reset and continue
        numeric_count = 0;
        idx_one = idx_two;
        idx_two += 1;
    }
    if idx_one != idx_two {
        _append_to_output(
            &mut output,
            working_str[idx_one],
            idx_two - idx_one - numeric_count,
        );
    }
    output
}
fn main() {
    let args = Args::parse();
    println!("Working on: {}", args.arbitrary_string);
    let working_str = args.arbitrary_string.chars().collect::<Vec<char>>();
    // Needs to be a vec to index

    let output = string_to_compressed_string(working_str);
    println!("Output: {}", output);
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_one() {
        let input = "aaabccccdd".to_string().chars().collect::<Vec<char>>();
        let output = string_to_compressed_string(input);
        assert_eq!(output, "a3bc4d2".to_string());
    }

    #[test]
    fn test_two() {
        let input = "aaaaaffffffffffc"
            .to_string()
            .chars()
            .collect::<Vec<char>>();
        let output = string_to_compressed_string(input);
        assert_eq!(output, "a5f10c".to_string());
    }

    #[test]
    fn test_three() {
        let input = "abcd".to_string().chars().collect::<Vec<char>>();
        let output = string_to_compressed_string(input);
        assert_eq!(output, "abcd".to_string());
    }

    #[test]
    fn test_four() {
        let input = "ccceee12eccceee".to_string().chars().collect::<Vec<char>>();
        let output = string_to_compressed_string(input);
        assert_eq!(output, "c3e4c3e3".to_string());
    }

    #[test]
    fn test_five() {
        let input = "effeac01cb65c".to_string().chars().collect::<Vec<char>>();
        let output = string_to_compressed_string(input);
        assert_eq!(output, "ef2eac2bc".to_string());
    }
}
