import gleam/dynamic.{decode1, field}

pub type User {
    LoggedIn(with: Int)
    Guest
}

pub fn user_decoder() {
    decode1(LoggedIn,
    field("session", dynamic.int)
    )
}