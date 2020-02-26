defmodule Helix.UsersTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  doctest Helix.Users

  setup do
    ExVCR.Config.filter_request_headers("Client-ID")
    HTTPoison.start()
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
end
