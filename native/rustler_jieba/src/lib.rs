use jieba_rs::Jieba;

#[rustler::nif]
fn split(txt: String) -> Vec<String> {
    let jieba = Jieba::new();
    return jieba.cut(&txt, true).into_iter().map(|s| s.to_string()).collect();
}

rustler::init!("Elixir.Jieba", [split]);
