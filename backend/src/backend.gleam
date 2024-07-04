import dot_env/env
import gleam/dynamic.{from}
import gleam/http.{Get}
import gleam/http/request
import gleam/http/response
import gleam/httpc
import gleam/int.{parse}
import gleam/io
import gleam/option.{None, Some}
import gleam/result.{unwrap}
import gleam/string_builder.{to_string}
import internal/rest.{
  get_channel_endpoint, get_channel_message_request_query, get_messages_endpoint,
}
import model/request_param.{GetChannelMessagesRequest}

const port = 8008

pub fn main() {
  let vs_forum_endpoint =
    env.get("VSFORUM")
    |> unwrap("")
    |> parse()
    |> unwrap(0)
}