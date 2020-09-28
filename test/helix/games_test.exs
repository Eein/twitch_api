defmodule TwitchApi.Helix.GamesTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  doctest TwitchApi.Helix.Games
  alias TwitchApi.Helix.Games

  setup do
    ExVCR.Config.filter_request_headers("Client-ID")
    ExVCR.Config.filter_request_headers("Authorization")
    {:ok, _token} = TwitchApi.TokenCache.get()
    HTTPoison.start()
  end

  test "games request by id returns HTTP 200" do
    use_cassette "games/get" do
      client = TwitchApi.Client.new()
      res = Games.get(client, %{id: 21_779})
      data = res.body["data"]
      assert Enum.empty?(data) == false
      assert Enum.count(data) == 1
    end
  end

  test "games request by multiple ids returns HTTP 200" do
    use_cassette "games/get-multiple" do
      client = TwitchApi.Client.new()
      res = Games.get(client, %{id: [21_779, 493_057]})
      data = res.body["data"]
      assert Enum.empty?(data) == false
      assert Enum.count(data) == 2
    end
  end
end
