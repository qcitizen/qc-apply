use clap::Parser;

#[derive(Parser, Debug)]
#[command(author, version, about, long_about = None)]
struct Args {
    /// Some Arbitrary String
    #[arg(short, long)]
    arbitrary_string: String,
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
fn string_to_compressed_string(working_str: Vec<char>) {
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
            // Ignore and continue
            numeric_count += 1;
            idx_two += 1;
            continue;
        }
        output.push_str(&working_str[idx_one].to_string());
        output.push_str(&(idx_two - idx_one - numeric_count).to_string());
        numer_count = 0;
        idx_two += 1;
        idx_one = idx_two;
    }
    if idx_one != idx_two {
        output.push_str(&working_str[idx_one].to_string());
        output.push_str(&(idx_two - idx_one - numeric_count).to_string());
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
fn test_one() {
    let input = "aaabccccdd".to_string().chars().collect::<Vec<char>>();
    let output = string_to_compressed_string(input);
    assert_eq!(output, "a3bc4d2".to_string());
}

#[cfg(test)]
fn test_two() {
    let input = "aaaaaffffffffffc"
        .to_string()
        .chars()
        .collect::<Vec<char>>();
    let output = string_to_compressed_string(input);
    assert_eq!(output, "a5f10c".to_string());
}

#[cfg(test)]
fn test_three() {
    let input = "abcd".to_string().chars().collect::<Vec<char>>();
    let output = string_to_compressed_string(input);
    assert_eq!(output, "a1b1c1d1".to_string());
}

#[cfg(test)]
fn test_four() {
    let input = "ccceee12eccceee".to_string().chars().collect::<Vec<char>>();
    let output = string_to_compressed_string(input);
    assert_eq!(output, "c3e4c3e3".to_string());
}

#[cfg(test)]
fn test_five() {
    let input = "effeac01cb65c".to_string().chars().collect::<Vec<char>>();
    let output = string_to_compressed_string(input);
    assert_eq!(output, "ef2eac2bc".to_string());
}
