defmodule Helix.GamesTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  doctest Helix.Games

  setup do
    ExVCR.Config.filter_request_headers("Client-ID")
    HTTPoison.start()
  end

  test "games request by id returns HTTP 200" do
    use_cassette "games/get" do
      client = Helix.Client.new()
      res = Helix.Games.get(client, %{id: 21_779})
      data = res.body["data"]
      assert Enum.empty?(data) == false
      assert Enum.count(data) == 1
    end
  end

  test "games request by multiple ids returns HTTP 200" do
    use_cassette "games/get-multiple" do
      client = Helix.Client.new()
      res = Helix.Games.get(client, %{id: [21_779, 493_057]})
      data = res.body["data"]
      assert Enum.empty?(data) == false
      assert Enum.count(data) == 2
    end
  end
end
