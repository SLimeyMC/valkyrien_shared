import birl.{parse}
import gleam/dynamic.{
  bool, decode1, decode4, field, int, list, optional_field, string,
}
import internal/more_dynamic.{decode12, decode17, snowflake, time}
import model/discord.{type Message}

fn message_decoder() {
  decode12(
    Message,
    field("id", snowflake),
    field("channel_id", snowflake),
    field("user", user_decoder),
    field("content", string),
    field("timestamp", time),
    optional_field("edited_timestamp", time),
    optional_field("attachments", list(attachment_decoder)),
    optional_field("flags", int),
    optional_field("thread", channel_decoder),
    optional_field("position", int),
  )
}

// TODO: convert channeltype to it's type
fn channel_decoder() {
  decode4(
    Channel,
    field("id", snowflake),
    field("name", string),
    field("type", int),
    optional_field("guild_id", snowflake),
  )
}

// TODO: convert premium to it's type
fn user_decoder() {
  decode17(
    User,
    field("id", snowflake),
    field("username", string),
    field("discriminator", string),
    optional_field("global_name", string),
    optional_field("avatar", hash),
    optional_field("bot", bool),
    optional_field("system", bool),
    optional_field("mfa_enabled", bool),
    optional_field("avatar", hash),
    optional_field("accent_color", int),
    optional_field("locale", string),
    optional_field("verified", bool),
    optional_field("email", string),
    optional_field("flags", int),
    optional_field("premium_type", int),
    optional_field("public_flags", int),
    optional_field(
      "avatar_decoration_data",
      decode2(AvatarDecorationData, string, snowflake),
    ),
  )
}

fn attachment_decoder() {
  decode14(
    field("id", snowflake),
    field("filename", string),
    optional_field("title", string),
    optional_field("description", string),
    optional_field("content_type", string),
    field("size", int),
    field("url", string),
    field("proxy_url", string),
    optional_field("height", int),
    optional_field("width", int),
    optional_field("ephemeral", bool),
    optional_field("duration_secs", float),
    optional_field("waveform", string),
    optional_field("flags", int),
  )
}
