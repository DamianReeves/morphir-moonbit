///|
pub(open) trait ToMorphirJson {
  to_json(Self, MorphirJsonOptions) -> Json
}

///|
pub fn[A : ToMorphirJson] to_morphir_json(
  value : A,
  options : MorphirJsonOptions,
) -> Json {
  value.to_json(options)
}
