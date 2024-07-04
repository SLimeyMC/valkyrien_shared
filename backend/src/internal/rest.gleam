import gleam/dict
import gleam/dynamic
import gleam/http.{Get}
import gleam/http/request
import gleam/http/response
import gleam/httpc
import gleam/int
import gleam/json
import gleam/option.{type Option, None, Some, map}
import gleam/result
import gleam/string_builder.{type StringBuilder, append, from_string, to_string}
import gleam/uri.{query_to_string}
import gleeunit/should
import model/discord.{type Snowflake}
import model/request_param.{
  type GetChannelMessagesRequest, GetChannelMessagesRequest,
}
import internal/model

const api_version = 10

const endpoint_discord = "https://discord.com/api/v"

pub fn fetch_discord_message(
  channel_id: Int,
  around: Option(Snowflake),
  after: Option(Snowflake),
  before: Option(Snowflake),
  limit: Option(Int),
) {
  // get valkyrien skies' showcase endpoint
  let endpoint =
    get_channel_endpoint(channel_id)
    |> get_messages_endpoint()
    |> get_channel_message_request_query(GetChannelMessagesRequest(
      around,
      after,
      before,
      limit,
    ))
    |> to_string()

  let assert Ok(request) = request.to(endpoint)

  use response <- result.try(httpc.send(request))

  response.body
  |> json.decode(dynamic.list(of: model.message_decoder))
}

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
