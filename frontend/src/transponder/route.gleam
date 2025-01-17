import gleam/uri.{type Uri}
import pages/about_us
import pages/auth_discord
import pages/auth_index
import pages/error_404
import pages/index
import pages/invalid_path

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

pub fn update(state: Model) {
  case state {
    Auth(Discord) -> Nil
    _ -> Nil
  }
}

pub fn to_view(state: Model) {
  case state.current_route {
    RouteIndex -> index.to_lustre()
    AboutUs -> about_us.to_lustre()
    Auth(AuthIndex) -> auth_index.to_lustre()
    Auth(Discord) -> auth_discord.to_lustre()
    Error404 -> error_404.to_lustre()
    _ -> invalid_path.to_lustre(state)
  }
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
