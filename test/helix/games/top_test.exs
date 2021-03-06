defmodule TwitchApi.Helix.Games.TopTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias TwitchApi.Helix.Games.Top

  doctest TwitchApi.Helix.Games.Top

  setup do
    ExVCR.Config.filter_request_headers("Client-ID")
    ExVCR.Config.filter_request_headers("Authorization")
    {:ok, _token} = TwitchApi.TokenCache.get()
    HTTPoison.start()
  end

  test "games/top request returns HTTP 200" do
    use_cassette "games/top" do
      client = TwitchApi.Client.new()
      res = Top.get(client)
      assert Enum.empty?(res.body["data"]) == false
    end
  end

  test "games/top after request returns HTTP 200" do
    use_cassette "games/top-after" do
      client = TwitchApi.Client.new()
      res = Top.get(client, %{after: "eyJzIjoyMCwiZCI6ZmFsc2UsInQiOnRydWV9"})
      data = res.body["data"]
      assert Enum.empty?(data) == false
      assert Enum.at(data, 0)["name"] != "League of Legends"
    end
  end

  test "games/top first request returns HTTP 200" do
    use_cassette "games/top-first" do
      client = TwitchApi.Client.new()
      res = Top.get(client, %{first: 7})
      data = res.body["data"]
      assert Enum.empty?(data) == false
      assert Enum.count(data) == 7
    end
  end
end
