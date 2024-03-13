use std::fs::File;
use std::io::BufReader;

use jieba_rs::Jieba;

#[rustler::nif]
fn split(text: String) -> Vec<String> {
    let jieba = Jieba::new();
    return jieba.cut(&text, true).into_iter().map(|s| s.to_string()).collect();
}

#[rustler::nif]
fn split_custom(text: String, dict_path: String) -> Vec<String> {
    return match File::open(dict_path) {
      Ok(f) => {
        let mut reader = BufReader::new(f);
        let mut jieba = Jieba::new();
        return match jieba.load_dict(&mut reader) {
          Ok(_) => jieba.cut(&text, true).into_iter().map(|s| s.to_string()).collect(),
          Err(err) => vec!(err.to_string())
        };
      },
      Err(err) => vec!(err.to_string())
    };
}

rustler::init!("Elixir.Jieba", [split, split_custom]);
