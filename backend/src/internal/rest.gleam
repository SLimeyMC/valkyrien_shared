import gleam/int
import gleam/list
import gleam/option.{type Option, None, Some, map}
import gleam/string_builder.{type StringBuilder, append, from_string}
import gleam/uri.{query_to_string}
import model/request_param.{type GetChannelMessagesRequest}

const api_version = 10

const endpoint_discord = "https://discord.com/api/v"

pub fn get_channel_endpoint(channel_id: Int) {
  {
    endpoint_discord
    <> int.to_string(api_version)
    <> "/"
    <> int.to_string(channel_id)
  }
  |> from_string()
}

pub fn get_messages_endpoint(channel_endpoint: StringBuilder) {
  append(channel_endpoint, "/messages")
}

pub fn get_channel_message_request_query(
  message_endpoint: StringBuilder,
  query: GetChannelMessagesRequest,
) {
  let query =
    []
    |> prepend_maybe("around", query.around)
    |> prepend_maybe("before", query.before)
    |> prepend_maybe("after", query.after)
    |> prepend_maybe(
      "limit",
      map(query.limit, with: fn(x) { int.to_string(x) }),
    )
    |> query_to_string()
  append(message_endpoint, query)
}

fn prepend_maybe(
  acc: List(#(String, String)),
  key: String,
  value: Option(String),
) {
  case value {
    Some(value) -> [#(key, value), ..acc]
    None -> acc
  }
}
