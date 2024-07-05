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
