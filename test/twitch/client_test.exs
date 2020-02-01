defmodule Twitch.ClientTest do
  use ExUnit.Case
  doctest Twitch.Client

  setup do
    System.delete_env("TWITCH_CLIENT_ID")
    System.delete_env("TWITCH_CLIENT_SECRET")
    System.delete_env("TWITCH_ENDPOINT")

    on_exit(fn ->
      System.delete_env("TWITCH_CLIENT_ID")
      System.delete_env("TWITCH_CLIENT_SECRET")
      System.delete_env("TWITCH_ENDPOINT")
    end)
  end

  test "setting TWITCH_ENDPOINT overrides the default endpoint" do
    System.put_env("TWITCH_CLIENT_ID", "ABC123")
    System.put_env("TWITCH_CLIENT_SECRET", "DEF456")
    System.put_env("TWITCH_ENDPOINT", "https://nottwitchapi.com")
    %{auth: _, endpoint: endpoint} = Twitch.Client.new()
    assert endpoint == "https://nottwitchapi.com"
  end

  test "not setting shows the default endpoint" do
    System.put_env("TWITCH_CLIENT_ID", "ABC123")
    System.put_env("TWITCH_CLIENT_SECRET", "DEF456")
    %{auth: _, endpoint: endpoint} = Twitch.Client.new()
    assert endpoint == "https://api.twitch.tv/helix/"
  end

  test "new/0 raises error when missing TWITCH_CLIENT_ID" do
    error = ~r/^could not fetch environment variable \"TWITCH_CLIENT_ID\"/

    assert_raise ArgumentError, error, fn -> Twitch.Client.new() end
  end

  test "new/0 raises error when missing TWITCH_CLIENT_SECRET" do
    System.put_env("TWITCH_CLIENT_ID", "ABC123")
    error = ~r/^could not fetch environment variable \"TWITCH_CLIENT_SECRET\"/

    assert_raise ArgumentError, error, fn -> Twitch.Client.new() end
  end

  test "new/1 raises ArgumentError when nil :client_id" do
    error = ~r/^:client_id not set or is empty$/
    auth = %{client_id: nil, client_secret: "whereisid"}
    assert_raise ArgumentError, error, fn -> Twitch.Client.new(auth) end
  end

  test "new/1 raises ArgumentError when empty :client_id" do
    error = ~r/^:client_id not set or is empty$/
    auth = %{client_id: "", client_secret: "whereisid"}
    assert_raise ArgumentError, error, fn -> Twitch.Client.new(auth) end
  end

  test "new/1 raises ArgumentError when nil :client_secret" do
    error = ~r/^:client_secret not set or is empty$/
    auth = %{client_id: "whereissecret", client_secret: nil}
    assert_raise ArgumentError, error, fn -> Twitch.Client.new(auth) end
  end

  test "new/1 raises ArgumentError when empty :client_secret" do
    error = ~r/^:client_secret not set or is empty$/
    auth = %{client_id: "whereissecret", client_secret: ""}
    assert_raise ArgumentError, error, fn -> Twitch.Client.new(auth) end
  end
end
