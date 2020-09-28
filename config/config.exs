import Config

config :twitch_api,
  client_id: System.get_env("TWITCH_CLIENT_ID"),
  client_secret: System.get_env("TWITCH_CLIENT_SECRET"),
  extension_client_id: System.get_env("TWITCH_EXTENSION_CLIENT_ID"),
  extension_client_secret: System.get_env("TWITCH_EXTENSION_CLIENT_SECRET"),
  id_endpoint: System.get_env("TWITCH_ID_API_ENDPOINT", "https://id.twitch.tv"),
  helix_endpoint: System.get_env("TWITCH_HELIX_API_ENDPOINT", "https://api.twitch.tv"),
  extension_endpoint: System.get_env("TWITCH_EXTENSION_API_ENDPOINT", "https://api.twitch.tv")
