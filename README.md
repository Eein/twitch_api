# TwitchApi

[![Tests](https://github.com/eein/twitch_api/workflows/Tests/badge.svg)](https://github.com/Eein/twitch_api/actions)

API Wrapper for the New Twitch API (TwitchApi)

This package is *NOT* ready for production.

If you decide to use this, ensure you pull from the specific commit hash that works for your application; I'll be updating master quite frequently with breaking changes.

## Installation

Not available in hex (yet)

```elixir
def deps do
  [
    {:twitch_api, "~> 0.1.0"}
  ]
end
```

## Description

The Twitch Api has a few API's that have their own requirements - this package handles all of them in isolation with the same client.

The default API's are:
- https://api.twitch.tv/helix
- https://api.twitch.tv/extensions
- https://id.twitch.tv

## Environment Variables

The `TwitchApi.Client` may use environment variables to bootstrap with `new/0` otherwise defaults will be used. See the following environment variables:

```
TWITCH_CLIENT_ID=
TWITCH_CLIENT_SECRET=
TWITCH_EXTENSION_CLIENT_ID=
TWITCH_EXTENSION_CLIENT_SECRET=
TWITCH_HELIX_API_ENDPOINT=
TWITCH_EXTENSION_API_ENDPOINT=
TWITCH_ID_API_ENDPOINT=
```

You may also use config:

```elixir
config :twitch_api,
  client_id: System.get_env("TWITCH_CLIENT_ID"),
  client_secret: System.get_env("TWITCH_CLIENT_SECRET"),
  extension_client_id: System.get_env("TWITCH_EXTENSION_CLIENT_ID"),
  extension_client_secret: System.get_env("TWITCH_EXTENSION_CLIENT_SECRET"),
  url: System.get_env("TWITCH_API_URL")
```

## In Progress

`x` is complete

`-` is in progress or needs tests

|  ?  | Resource            |	Endpoint                  |
| --- | ------------------- | ------------------------- |
| [ ] | Analytics           | Extension Analytics       |
| [ ] | Analytics           | Game Analytics            |
| [ ] | Bits                | Bits Leaderboard          |
| [ ] | Bits                | Extension Transactions    |
| [ ] | Clips               | Create Clip               |
| [ ] | Clips               | Get Clip                  |
| [ ] | Entitlements        | Create Entitlement x      |
| [ ] | Entitlements        | Get Code Status           |
| [ ] | Entitlements        | Redeem Code               |
| [x] | Games               | Get Top Games             |
| [x] | Games               | Get Games                 |
| [ ] | Moderation          | Check Automod Status      |
| [ ] | Moderation          | Get Banned Events         |
| [ ] | Moderation          | Get Banned Users          |
| [ ] | Moderation          | Get Moderators            |
| [ ] | Moderation          | Get Moderator Events      |
| [X] | Streams             | Get Streams               |
| [ ] | Streams             | Get Streams Metadata      |
| [ ] | Streams             | Create Stream Marker      |
| [ ] | Streams             | Get Stream Markers        |
| [ ] | Subscriptions       | Get Broadcasters Subs     |
| [ ] | Tags                | Get All Stream Tags       |
| [ ] | Tags                | Get Stream Tags           |
| [ ] | Tags                | Replace Stream Tags       |
| [X] | Users               | Get Users                 |
| [X] | Users               | Get Users Follows         |
| [ ] | Users               | Update User               |
| [ ] | Users               | Get User Extensions       |
| [ ] | Users               | Update User Extensions    |
| [ ] | Videos              | Get Videos                |
| [-] | Webhooks            | Get Webhook Subscriptions |

## Webhooks - In Progress

|  ?  | Resource            |	Endpoint                  |
| --- | ------------------- | ------------------------- |
| [-] | Hub                 | Subscribe                 |
| [-] | Hub                 | Unsubscribe               |


## Docs

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/twitch_api](https://hexdocs.pm/twitch_api).
