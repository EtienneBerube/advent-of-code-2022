
// TEST
use std::fs::File;
use std::io::prelude::*;
use std::path::Path;

fn main() {
    let path = Path::new("test.txt");
    
    // Open the path in read-only mode, returns `io::Result<File>`
    let mut file = match File::open(&path) {
        Err(why) => panic!("couldn't open input file: {}", why),
        Ok(file) => file,
    };
    
    // Read the file contents into a string, returns `io::Result<usize>`
    let mut s = String::new();
    if let Err(why) = file.read_to_string(&mut s) {
        panic!("couldn't read input file: {}", why)
    }
    
    let v: Vec<&str> = s.split('\n').collect();
    let mut max = 0;
    let mut counter = 0;
    
    for val in v {
        if val.is_empty(){
            if counter > max{
                max = counter;
            }
            // Refresh
            counter = 0;
        }else{
           counter += val.parse::<i32>().unwrap();
        }
    }
    
    println!("{} calories", max);
}