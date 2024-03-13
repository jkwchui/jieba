use jieba_rs::Jieba;

#[rustler::nif]
fn add(a: i64, b: i64) -> i64 {
    a + b
}

#[rustler::nif]
fn split(txt: String) -> Vec<String> {
    let jieba = Jieba::new();
    let mut v = Vec::new();

    for s in jieba.cut(&txt, true) {
      v.push(s.to_string());
    }
    return v;
}

rustler::init!("Elixir.Jieba", [add, split]);
