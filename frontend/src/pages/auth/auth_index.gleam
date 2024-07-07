import lustre/attribute.{alt, class, href, id, rel, src, target}
import lustre/element/html.{a, button, div, h1, header, img, nav, p, text}

pub fn to_lustre() {
  div([class("hero")], [
    div([class("auth")], [
      h1([], [text("Auth")]),
      html.form([attribute.action("localhost:8008/auth")], [
        html.label([attribute.for("name")], [text("Username: ")]),
        html.input([
          attribute.type_("text"),
          id("name"),
          attribute.name("name"),
          attribute.pattern("^(?!.*\\.\\.)[a-z\\d_.]{2,32}$"),
          attribute.attribute(
            "title",
            "Username must be 2-32 characters long, containings lowercase letters, numbers, periods (.), or underscores (_), but cannot start with two consecutive periods",
          ),
          attribute.placeholder("your name"),
          attribute.required(True),
        ]),
        html.label([attribute.for("email")], [text("Email: ")]),
        html.input([
          attribute.type_("email"),
          id("email"),
          attribute.name("email"),
          attribute.placeholder("your email"),
          attribute.required(True),
        ]),
        html.label([attribute.for("password")], [text("Password: ")]),
        html.input([
          attribute.type_("text"),
          id("password"),
          attribute.name("password"),
          attribute.placeholder("your password"),
          attribute.required(True),
        ]),
        html.input([attribute.type_("submit"), attribute.value("Submit")]),
      ]),
      html.details([], [
        html.summary([], [text("More option")]),
        html.div([], [a([href("check")], [text("Discord")])]),
      ]),
    ]),
  ])
}
