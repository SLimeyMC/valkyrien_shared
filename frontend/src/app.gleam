import auth/auth.{type User, Guest,LoggedIn}
import gleam/dict.{type Dict, filter, keys}
import gleam/list.{first}
import gleam/string.{contains, split}
import gleam/uri.{type Uri}
import lustre
import lustre/attribute.{alt, class, href, id, rel, src, target}
import lustre/effect.{type Effect}
import lustre/element.{text}
import lustre/element/html.{a, button, div, h1, header, img, nav, p}
import lustre/element/svg
import modem
import router/route.{
  type Route, AboutUs, Auth, AuthIndex, Discord, Error404, Me, MeIndex, Profile,
  RouteIndex, Settings, route_encode,
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

pub type Model {
  Model(current_route: Route, current_user: User)
}

fn init(state) {
  let assert Ok(initial_uri) = modem.initial_uri()
  #(
    Model(route_encode(initial_uri), Guest),
    modem.init(fn(uri: Uri) { OnRouteChange(route.route_encode(uri)) }),
  )
}

pub type Msg {
  OnRouteChange(Route)
  OnLogged(with: Int)
}

fn update(state, msg) {
  case msg {
    OnRouteChange(route) -> #(Model(..state, current_route: route), effect.none())
    OnLogged(with) -> #(Model(..state, current_user: LoggedIn(with)), effect.none())
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
    state.current_route
      |> route.to_view(),
  ])
}
