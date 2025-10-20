///|
pub struct Name(@list.List[String]) derive(Show)

///|
pub fn Name::from_string(name : String) -> Name {
  fn split_into_words(
    input : StringView,
    words : @list.List[String],
  ) -> @list.List[String] {
    lexmatch input with longest {
      ("([a-zA-Z][a-z]*|[0-9]+)" as word, rest) =>
        split_into_words(rest, @list.cons(word.to_string().to_lower(), words))
      (".", rest) => split_into_words(rest, words)
      _ => words.rev()
    }
  }

  Name(split_into_words(name, @list.default()))
}

//pub fn Name::to_title_case(name: Name) -> String {
//  ...
//}

///|
pub impl @codec.ToMorphirJson for Name with to_json(
  self,
  options : @codec.MorphirJsonOptions,
) -> Json {
  match options.name_encoding {
    @codec.NameJsonEncoding::AsString => Json::string(self.0.iter().join("-"))
    @codec.NameJsonEncoding::AsList => self.0.to_json()
  }
}
