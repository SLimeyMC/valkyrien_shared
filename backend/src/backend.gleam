import dot_env/env
import gleam/http.{Get}
import gleam/http/request
import gleam/http/response
import gleam/httpc
import gleam/int.{parse}
import gleam/io
import gleam/option.{None, Some}
import gleam/result.{unwrap}
import gleam/string_builder.{to_string}
import gleam/dynamic.{from}
import internal/rest.{
  get_channel_endpoint, get_channel_message_request_query, get_messages_endpoint,
}
import model/request_param.{GetChannelMessagesRequest}

pub fn main() {
  let vs_forum_endpoint =
    env.get("VSFORUM")
    |> unwrap("")
    |> parse()
    |> unwrap(0)

  // get valkyrien skies' showcase endpoint
  let endpoint =
    get_channel_endpoint(vs_forum_endpoint)
    |> get_messages_endpoint()
    |> get_channel_message_request_query(GetChannelMessagesRequest(
      around: None,
      after: None,
      before: None,
      limit: Some(5),
    ))
    |> to_string()

  let assert Ok(request) = request.to(endpoint)

  use response <- result.try(httpc.send(request))
  
  io.println("Hello from backend!")
  
  case response.status {
    200 -> response.get_header(response, "content-type")
    _ -> Error("uh oh!")
  }
}
