defmodule Helix.StreamsTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  doctest Helix.Streams

  setup do
    ExVCR.Config.filter_request_headers("Client-ID")
    HTTPoison.start
  end

  test "streams request returns HTTP 200" do
    use_cassette "streams/get" do
      client = Helix.Client.new()
      res = Helix.Streams.get(client)
      assert Enum.empty?(res.body["data"]) == false
    end
  end

  test "streams after request returns HTTP 200" do
    use_cassette "streams/get-after" do
      client = Helix.Client.new()

      res =
        Helix.Streams.get(client, %{
          after:
            "ZXlKeklqb3pOVE16Tnk0eU1qTTNPVEUyTmpnME56VXNJbVFpT21aaGJITmxMQ0owSWpwMGNuVmxmUT09IGV5SnpJam8wTWpNekxqY3dPRFV3TnpFeU5UY3lOaXdpWkNJNlptRnNjMlVzSW5RaU9uUnlkV1Y5"
        })

      data = res.body["data"]
      assert Enum.empty?(data) == false
      assert Enum.at(data, 0)["name"] != "League of Legends"
    end
  end

  test "streams first request returns HTTP 200" do
    use_cassette "streams/get-first" do
      client = Helix.Client.new()
      res = Helix.Streams.get(client, %{first: 7})
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
