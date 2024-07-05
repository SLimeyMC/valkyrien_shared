import gleam/uri.{type Uri}
import lustre
import lustre/attribute.{alt, class, href, id, rel, src, target}
import lustre/effect.{type Effect}
import lustre/element.{text}
import lustre/element/html.{a, button, div, h1, header, img, nav, p}
import modem
import router/route.{
  type Route, AboutUs, Auth, AuthIndex, Discord, Error404, Me, MeIndex, Profile,
  RouteIndex, Settings,
}
import tardis

// Start application
pub fn main() {
  let assert Ok(main) = tardis.single("main")

  lustre.application(init, update, view)
  |> tardis.wrap(with: main)
  |> lustre.start("#app", 0)
  |> tardis.activate(with: main)
}

fn init(state) {
  let assert Ok(initial_uri) = modem.initial_uri()
  #(
    case initial_uri.path {
      "/" -> RouteIndex
      "/about_us" -> AboutUs
      "/auth" -> Auth(AuthIndex)
      "/auth/discord" -> Auth(Discord)
      "/me" -> Me(MeIndex)
      "/me/profile" -> Me(Profile)
      "/me/settings" -> Me(Settings)
      _ -> Error404
    },
    modem.init(on_url_change),
  )
}

pub type Msg {
  OnRouteChange(Route)
}

fn update(state, msg) {
  case msg {
    OnRouteChange(route) -> #(route, effect.none())
  }
}

pub fn on_url_change(uri: Uri) {
  case uri.path_segments(uri.path) {
    [] -> OnRouteChange(RouteIndex)
    ["about_us"] -> OnRouteChange(AboutUs)
    ["auth"] -> OnRouteChange(Auth(AuthIndex))
    ["auth", "discord"] -> OnRouteChange(Auth(Discord))
    ["me"] -> OnRouteChange(Me(MeIndex))
    ["me", "profile"] -> OnRouteChange(Me(Profile))
    ["me", "settings"] -> OnRouteChange(Me(Settings))
    _ -> OnRouteChange(Error404)
  }
}

fn view(state) {
  div([id("app")], [
    nav([class("top-nav")], [
      html.span([], [a([href("/")], [text("Valkyrien Skies!")])]),
      html.ul([], [
        html.li([], [a([href("/about_us")], [text("About Us")])]),
        html.li([], [a([href("/me")], [text("Me")])]),
        html.li([], [a([href("/auth")], [text("Authenticate")])]),
      ]),
    ]),
    case state {
      RouteIndex ->
        div([class("projects-list")], [
          div([class("project-card")], [h1([], [text("Plane 1")])]),
          div([class("project-card")], [h1([], [text("Plane 2")])]),
          div([class("project-card")], [h1([], [text("Plane 3")])]),
          div([class("project-card")], [h1([], [text("Plane 4")])]),
        ])
      AboutUs -> html.h1([], [html.text("About Us")])
      Auth(AuthIndex) -> html.h1([], [html.text("Auth")])
      Error404 -> html.h1([], [html.text("Error404")])
      _ -> html.h1([], [html.text("wuh what?")])
    },
  ])
}
