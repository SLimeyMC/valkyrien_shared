import gleam/option.{type Option}
import model/discord.{type Snowflake}

pub type GetChannelMessagesRequest {
  GetChannelMessagesRequest(
    around: Option(Snowflake),
    before: Option(Snowflake),
    after: Option(Snowflake),
    limit: Option(Int),
  )
}

// pub fn create_get_channel_messages_request_query(around: Option(Snowflake), after: Option(Snowflake), before: Option(Snowflake), limit: Option(Int)) {
//   GetChannelMessagesRequest(around, after, before, limit)
// }