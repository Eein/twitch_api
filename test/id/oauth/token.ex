defmodule TwitchApi.ID.OAuth.TokenTest do
  @moduledoc false

  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias TwitchApi.Client
  alias TwitchApi.ID
  alias TwitchApi.ID.OAuth.Token
  alias TwitchApi.TokenCache

  setup do
    ExVCR.Config.filter_request_headers("Client-ID")
    ExVCR.Config.filter_request_headers("Authorization")
    {:ok, _token} = TokenCache.get()
    HTTPoison.start()
  end

  test "has the correct URL" do
    assert Token.url() == "https://id.twitch.tv/oauth2/token"
  end

  test "oauth2/token request returns HTTP 200" do
    use_cassette "oauth2/token" do
      client = Client.new()
      res = Token.post(client)
      assert res.body["access_token"]
    end
  end
end
