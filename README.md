# Helix

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
TWITCH_ENDPOINT=
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
| [ ] | Games               | Get Top Games             |
| [ ] | Games               | Get Games                 |
| [ ] | Moderation          | Check Automod Status      |
| [ ] | Moderation          | Get Banned Events         |
| [ ] | Moderation          | Get Banned Users          |
| [ ] | Moderation          | Get Moderators            |
| [ ] | Moderation          | Get Moderator Events      |
| [ ] | Streams             | Get Streams               |
| [ ] | Streams             | Get Streams Metadata      |
| [ ] | Streams             | Create Stream Marker      |
| [ ] | Streams             | Get Stream Markers        |
| [ ] | Subscriptions       | Get Broadcasters Subs     |
| [ ] | Tags                | Get All Stream Tags       |
| [ ] | Tags                | Get Stream Tags           |
| [ ] | Tags                | Replace Stream Tags       |
| [ ] | Users               | Get Users                 |
| [ ] | Users               | Get Users Follows         |
| [ ] | Users               | Update User               |
| [ ] | Users               | Get User Extensions       |
| [ ] | Users               | Update User Extensions    |
| [ ] | Videos              | Get Videos                |
| [ ] | Webhooks            | Get Webhook Subscriptions |


## Docs

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/helix](https://hexdocs.pm/helix).
