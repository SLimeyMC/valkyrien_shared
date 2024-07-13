import lustre/attribute.{alt, class, href, id, rel, src, target}
import lustre/element/html.{a, button, div, h1, header, img, nav, p, text}

pub fn to_lustre() {
  div([class("projects-list")], [
    div([class("project-card")], [h1([], [text("Plane 1")])]),
    div([class("project-card")], [h1([], [text("Plane 2")])]),
    div([class("project-card")], [h1([], [text("Plane 3")])]),
    div([class("project-card")], [h1([], [text("Plane 4")])]),
  ])
}
