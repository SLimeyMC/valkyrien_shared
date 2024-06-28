import sketch
import sketch/size.{em}

// No child combinators and relational selector sad
pub fn header_class() {
  [
    sketch.display("flex"),
    sketch.flex_direction("column"),
    sketch.background("blue"),
    sketch.padding(em(1)),
    sketch.target([sketch.color("black")]),
  ]
  |> sketch.class()
  |> sketch.to_lustre()
}
