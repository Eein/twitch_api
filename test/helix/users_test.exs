defmodule Helix.UsersTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  doctest Helix.Users

  setup do
    ExVCR.Config.filter_request_headers("Client-ID")
    :ok
  end

  test "users request returns HTTP 200" do
    use_cassette "users/get" do
      client = Helix.Client.new()
      res = Helix.Users.get(client, %{id: "44322889"})
      assert Enum.empty?(res.body["data"]) == false
    end
  end

  test "users multiple ids request returns HTTP 200" do
    use_cassette "users/get-ids" do
      client = Helix.Client.new()
      res = Helix.Users.get(client, %{id: ["44322889", "23161357"]})
      data = res.body["data"]
      assert Enum.empty?(data) == false
      assert Enum.at(data, 0)["display_name"] == "dallas"
      assert Enum.at(data, 1)["display_name"] == "LIRIK"
      assert Enum.count(data) == 2
    end
  end

  test "users multiple request returns HTTP 200" do
    use_cassette "users/get-login" do
      client = Helix.Client.new()
      res = Helix.Users.get(client, %{login: ["dallas", "LIRIK"]})
      data = res.body["data"]
      assert Enum.empty?(data) == false
      assert Enum.at(data, 0)["display_name"] == "dallas"
      assert Enum.at(data, 1)["display_name"] == "LIRIK"
      assert Enum.count(data) == 2
    end
  end

  # Need to write a case and error for this
  test "users request looks up by bearer token if no id is attached", do: :not_implemented

  test "users-follows request returns HTTP 200" do
    use_cassette "users/follows-to" do
      client = Helix.Client.new()
      res = Helix.Users.get_follows(client, %{to_id: "23161357"})
      data = res.body["data"]
      assert Enum.at(data, 0)["to_name"] == "LIRIK"
      assert Enum.empty?(res.body["data"]) == false
    end
  end

  test "users-follows request to and from returns HTTP 200" do
    use_cassette "users/follows-to-and-from" do
      client = Helix.Client.new()
      res = Helix.Users.get_follows(client, %{from_id: "171003792", to_id: "23161357"})
      data = res.body["data"]
      assert Enum.at(data, 0)["to_name"] == "LIRIK"
      assert Enum.empty?(res.body["data"]) == false
    end
  end

  test "users-follows request without any id returns bad request" do
    use_cassette "users/follows-bad-req" do
      client = Helix.Client.new()
      message = ~r/^This endpoint requires from_id/
      assert_raise RuntimeError, message, fn -> Helix.Users.get_follows(client) end
    end
  end
end
