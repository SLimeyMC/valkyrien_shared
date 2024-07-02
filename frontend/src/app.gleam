import css
import gleam/int
import gleam/io
import gleam/result
import lustre
import lustre/attribute.{alt, class, href, id, rel, src, target}
import lustre/effect
import lustre/element.{text}
import lustre/element/html.{a, button, div, h1, header, img, nav, p}
import lustre/event.{on_click}
import sketch
import sketch/lustre as sketch_lustre
import sketch/options as sketch_options
import tardis

pub fn main() {
  let assert Ok(main) = tardis.single("main")

  let assert Ok(cache) =
    sketch_options.document()
    |> sketch_lustre.setup()

  let _ =
    view
    |> sketch_lustre.compose(cache)
    |> lustre.application(init, update, _)
    |> tardis.wrap(with: main)
    |> lustre.start("#app", 0)
    |> tardis.activate(with: main)

  Nil
}

fn init(state) {
  #(state, effect.none())
}

type Msg {
  Incr
  Decr
}

fn update(state, msg) {
  io.print("update: " <> int.to_string(state))
  case msg {
    Incr -> #(state + 1, effect.none())
    Decr -> #(state - 1, effect.none())
  }
}

fn view(state) {
  div([id("app")], [
    nav([class("top-nav")], [
      html.span([], [a([href("/")], [text("Valkyrien Skies!")])]),
      html.ul([], [
        html.li([], [a([href("aaaa")], [text("Hello!")])]),
        html.li([], [a([href("aaaa")], [text("Hello!")])]),
        html.li([], [a([href("aaaa")], [text("Hello!")])]),
      ]),
    ]),
    div([class("projects-list")], [
      div([class("project-card")], [h1([], [text("Plane 1")])]),
      div([class("project-card")], [h1([], [text("Plane 2")])]),
      div([class("project-card")], [h1([], [text("Plane 3")])]),
      div([class("project-card")], [h1([], [text("Plane 4")])]),
    ]),
  ])
}
