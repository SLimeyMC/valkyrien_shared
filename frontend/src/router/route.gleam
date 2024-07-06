import gleam/uri.{type Uri}

pub type Route {
  RouteIndex
  AboutUs
  Error404
  Auth(to: AuthRoute)
  Me(to: MeRoute)
}

pub type AuthRoute {
  AuthIndex
  Discord
}

pub type MeRoute {
  MeIndex
  Profile
  Settings
}

pub fn route_encode(uri: Uri) {
  case uri.path_segments(uri.path) {
    [] -> RouteIndex
    ["about_us"] -> AboutUs
    ["auth"] -> Auth(AuthIndex)
    ["auth", "discord"] -> Auth(Discord)
    ["me"] -> Me(MeIndex)
    ["me", "profile"] -> Me(Profile)
    ["me", "settings"] -> Me(Settings)
    _ -> Error404
  }
}