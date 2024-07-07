import lustre/attribute.{alt, class, href, id, rel, src, target}
import lustre/element/html.{a, button, div, h1, header, img, nav, p, text}

pub fn to_lustre() {
  div([class("hero")], [div([class("auth")], [h1([], [text("Auth")])])])
}
