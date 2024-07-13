import lustre/attribute.{alt, class, href, id, rel, src, target}
import lustre/element/html.{a, button, div, h1, header, img, nav, p, text}

// Add state for added security
const discord_oauth2 = "https://discord.com/oauth2/authorize?client_id=1258022001730125935&response_type=code&redirect_uri=http%3A%2F%2Flocalhost%3A5173%2Fauth%2Fdiscord&scope=messages.read+email+guilds+identify"

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
          attribute.pattern("^(?!.*\\.\\.)[\\w\\d_.]{2,32}$"),
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
        html.div([], [a([href(discord_oauth2)], [text("Discord")])]),
      ]),
    ]),
  ])
}
