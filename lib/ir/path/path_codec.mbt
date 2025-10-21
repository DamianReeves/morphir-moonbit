pub impl @codec.ToMorphirJson for Path with to_json(
  self : Path,
  options : @codec.MorphirJsonOptions,
) -> Json {
  @codec.ToMorphirJson::to_json(self.0, options)
}