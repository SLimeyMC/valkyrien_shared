import gleam/fetch
import gleam/http.{Http, Post}
import gleam/http/request
import gleam/int
import gleam/javascript/promise
import gleam/json
import gleam/list
import gleam/option
import gleam/pair
import gleam/result
import gleam/uri.{type Uri, parse_query}
import auth/user.{user_decoder}

pub fn handle_uri(uri: Uri) {
  let query =
    uri.query
    |> option.unwrap("")
    |> parse_query()
    |> result.unwrap([])
    |> list.first()
    |> result.unwrap(#("", ""))
  case pair.first(query) {
    "code" -> Ok(do_handle(query))
    _ -> Error("")
  }
}

fn do_handle(query: #(String, String)) {
  let code =
    pair.second(query)
    |> int.parse()
    |> result.unwrap(0)
    |> json.int()
  let body =
    json.object([#("oauth", code)])
    |> json.to_string()

  let req =
    request.new()
    |> request.set_scheme(Http)
    |> request.set_host("localhost")
    |> request.set_port(8008)
    |> request.set_path("/auth/discord")
    |> request.set_header("Content-Type", "application/json")
    |> request.set_body(body)
    |> request.set_method(Post)
    
  use resp <- promise.try_await(fetch.send(req))
  use resp <- promise.try_await(fetch.read_text_body(resp))
  
  json.decode(resp.body, using: user_decoder())
}

pub fn update() {
  todo
}
