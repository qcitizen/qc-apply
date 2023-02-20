use clap::Parser;

#[derive(Parser, Debug)]
#[command(author, version, about, long_about = None)]
struct Args {
    /// Some Arbitrary String
    #[arg(short, long)]
    arbitrary_string: String,
}

fn main() {
    println!("Hello, world!");
    let args = Args::parse();
    println!("{}", args.arbitrary_string);
}
