defmodule TwitchApi.Helix.StreamsTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  doctest TwitchApi.Helix.Streams

  alias TwitchApi.Client
  alias TwitchApi.Helix.Streams

  setup do
    ExVCR.Config.filter_request_headers("Client-ID")
    ExVCR.Config.filter_request_headers("Authorization")
    {:ok, _token} = TwitchApi.TokenCache.get()
    HTTPoison.start()
  end

  test "streams request returns HTTP 200" do
    use_cassette "streams/get" do
      client = Client.new()
      res = Streams.get(client)
      assert Enum.empty?(res.body["data"]) == false
    end
  end

  test "streams after request returns HTTP 200" do
    use_cassette "streams/get-after" do
      client = Client.new()

      res =
        Streams.get(client, %{
          after:
            "eyJiIjp7IkN1cnNvciI6ImV5SnpJam81T0RjNU1TNDBORFUzTkRZME5qWTROU3dpWkNJNlptRnNjMlVzSW5RaU9uUnlkV1Y5In0sImEiOnsiQ3Vyc29yIjoiZXlKeklqb3hOamMzTUM0NE1EVTVNelkzT0RJME1EWXNJbVFpT21aaGJITmxMQ0owSWpwMGNuVmxmUT09In19"
        })

      data = res.body["data"]
      assert Enum.empty?(data) == false
      assert Enum.at(data, 0)["name"] != "League of Legends"
    end
  end

  test "streams first request returns HTTP 200" do
    use_cassette "streams/get-first" do
      client = Client.new()
      res = Streams.get(client, %{first: 7})
      data = res.body["data"]
      assert Enum.empty?(data) == false
      assert Enum.count(data) == 7
    end
  end

  test "streams game_id request returns HTTP 200", do: :not_implemented
  test "streams language request returns HTTP 200", do: :not_implemented
  test "streams user_id request returns HTTP 200", do: :not_implemented
  test "streams user_login request returns HTTP 200", do: :not_implemented
end
