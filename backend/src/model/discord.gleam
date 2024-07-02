import birl.{type Time}
import gleam/option.{type Option}
import gleam/dynamic.{type Dynamic}

pub type Message {
  Message(
    id: Snowflake,
    channel_id: Snowflake,
    author: User,
    content: String,
    timestamp: Time,
    edited_timestamp: Option(Time),
    tts: Bool,
    mention_everyone: Bool,
    mentions: List(User),
    mention_roles: List(Role),
    mention_channels: Option(List(ChannelMention)),
    attachments: Option(Attachment),
    //embeds
    //reactions
    nonce: Option(Dynamic),
    pinned: Bool,
    webhook_id: Option(Snowflake),
    //type_: Int,
    //activity
    //appliation
    //application
    message_reference: Option(MessageReference),
    flags: Option(Int),
    referenced_message: Option(Message),
    //interaction_metadata
    //interacion
    thread: Option(Channel),
    
  )
}

pub type Snowflake =
  String

pub type Hash =
  String

pub type Channel {
  Channel(
    id: Snowflake,
    name: String,
    type_: ChannelType,
    guild_id: Option(Snowflake)
  )
}

pub type Role {
  Role(
    id: Snowflake,
    name: String,
    color: Int,
    hoist: Bool,
    icon: Option(Hash),
    unicode_emoji: Option(String),
    position: Int,
    permissions: String,
    managed: Bool,
    mentionable: Bool,
  )
}

pub type RoleTag {
  RoleTag(
    bot_id: Option(Snowflake),
    integration_id: Option(Snowflake),
    premium_subscriber: Option(Nil),
    subscription_listing_id: Option(Snowflake),
    available_for_purchase: Option(Nil),
    guild_connections: Option(Nil),
  )
}

pub type User {
  User(
    id: Snowflake,
    username: String,
    discriminator: String,
    global_name: Option(String),
    avatar: Option(Hash),
    bot: Option(Bool),
    system: Option(Bool),
    mfa_enabled: Option(Bool),
    banner: Option(Hash),
    accent_color: Option(Int),
    locale: Option(String),
    verified: Option(Bool),
    email: Option(String),
    flags: Option(Int),
    premium_type: Option(Premium),
    public_flags: Option(Int),
    avatar_decoration_data: Option(AvatarDecorationData),
  )
}

pub type MessageReference {
  MessageReference(
    message_id: Option(Snowflake),
    channel_id: Option(Snowflake),
    guild_id: Option(Snowflake),
    fail_if_not_exists: Option(Bool)
  )
}

pub type ChannelMention {
  ChannelMention(
    id: Snowflake,
    guild_id: Snowflake,
    // type is reserved keyword thus no
    type_: Int,
    name: String,
  )
}

pub type Attachment {
    Attachment(
        id: Snowflake,
        filename: String,
        title: Option(String),
        description: Option(String),
        content_type: Option(String),
        size: Int,
        url: String,
        proxy_url: String,
        height: Option(Int),
        width: Option(Int),
        ephemeral: Option(Bool),
        duration_secs: Option(Float),
        waveform: Option(String),
        flags: Option(Int)
    )
}

pub type Premium {
  None
  NitroClassic
  Nitro
  NitroBasic
}

pub type AvatarDecorationData {
  AvatarDecorationData(asset: String, sku_id: Snowflake)
}

pub type ChannelType {
  GuildText
  Dm
  GuildVoice
  GroupDm
  GuildCategory
  GuilfAnnouncement
  AnnouncementThread
  PublicThread
  PrivateThread
  GuildStageVoice
  GuildDirectory
  GuildForum
  GuildMedia
}