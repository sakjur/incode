use std::env;
use std::fs;
use std::process;

fn decibyte(bytes: f64) -> f64 {
    return bytes.log10() * 10.0_f64; 
}

fn main() {
    let iter = env::args().skip(1).map(|f| (fs::metadata(&f), f));

    for file in iter {
        let metadata = file.0;
        let name = file.1;
        match metadata {
            Ok(meta) => {
                println!("{:9.2}dBy {}", decibyte(meta.len() as f64), name)
            },
            Err(_) => {
                println!("File not found: {}", name);
                process::exit(1)
            }
        }
    }
}
