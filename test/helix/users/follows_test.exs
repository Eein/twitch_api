defmodule Helix.Users.FollowsTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias Hex.Users.Follows

  doctest Helix.Users.Follows

  setup do
    ExVCR.Config.filter_request_headers("Client-ID")
    HTTPoison.start()
  end

  test "users-follows request returns HTTP 200" do
    use_cassette "users/follows-to" do
      client = Helix.Client.new()
      res = Follows.get(client, %{to_id: "23161357"})
      data = res.body["data"]
      assert Enum.at(data, 0)["to_name"] == "LIRIK"
      assert Enum.empty?(res.body["data"]) == false
    end
  end

  test "users-follows request to and from returns HTTP 200" do
    use_cassette "users/follows-to-and-from" do
      client = Helix.Client.new()
      res = Follows.get(client, %{from_id: "171003792", to_id: "23161357"})
      data = res.body["data"]
      assert Enum.at(data, 0)["to_name"] == "LIRIK"
      assert Enum.empty?(res.body["data"]) == false
    end
  end

  test "users-follows request without any id returns bad request" do
    use_cassette "users/follows-bad-req" do
      client = Helix.Client.new()
      message = ~r/^This endpoint requires from_id/
      assert_raise RuntimeError, message, fn -> Follows.get(client) end
    end
  end
end
