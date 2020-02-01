import Config

config :helix,
  client_id: System.get_env("TWITCH_CLIENT_ID"),
  client_secret: System.get_env("TWITCH_CLIENT_SECRET"),
  url: System.get_env("TWITCH_API_URL")
