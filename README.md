# Helix

![Elixir CI](https://github.com/eein/helix/workflows/Elixir%20CI/badge.svg)

API Wrapper for the New Twitch API (Helix)

## Installation

Not available in hex (yet)

```elixir
def deps do
  [
    {:helix, "~> 0.1.0"}
  ]
end
```

## Environment Variables

The `Helix.Client` may use environment variables to bootstrap with `new/0` otherwise defaults will be used. See the following environment variables:

```
TWITCH_CLIENT_ID=
TWITCH_CLIENT_SECRET=
TWITCH_API_URL=
```

You may also use config:

```elixir
config :helix,
  client_id: System.get_env("TWITCH_CLIENT_ID"),
  client_secret: System.get_env("TWITCH_CLIENT_SECRET"),
  url: System.get_env("TWITCH_API_URL")
```

## In Progress

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
| [ ] | Webhooks            | Get Webhook Subscriptions |


## Docs

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/helix](https://hexdocs.pm/helix).
