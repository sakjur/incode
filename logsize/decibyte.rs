use std::env;
use std::fs;
use std::process;

fn decibyte(bytes: f64) -> f64 {
    return bytes.log10() * 10.0_f64; 
}

fn main() {
    let iter = env::args().skip(1).map(|f| (fs::metadata(&f), f));
    let mut total = 0.0_f64;

    for file in iter {
        let metadata = file.0;
        let name = file.1;
        match metadata {
            Ok(meta) => {
                let size = meta.len() as f64;
                total = total + size;
                println!("{:9.2}dBy {}", decibyte(size), name)
            },
            Err(_) => {
                println!("File not found: {}", name);
                process::exit(1)
            }
        }
    }

    if env::args().count() == 1 {
        let exec: String = match env::args().next() {
            Some(e) => e,
            None => "decibyte".to_owned() // Should never be used 
        };
        println!("Usage: {} <file> [file1 file2 ...]", exec)
    }
    if env::args().count() > 2 {
        println!("{:9.2}dBy == TOTAL ==", decibyte(total));
    }
}
