///|
test "Name::from_string" {
  let name = Name::from_string("Morphir.IR.Name")
  let actualJson = name.to_json(Default::default())
  @json.inspect(actualJson, content=["morphir", "i", "r", "name"])
}
