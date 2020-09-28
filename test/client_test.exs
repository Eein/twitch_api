defmodule TwitchApi.ClientTest do
  use ExUnit.Case, async: true
  doctest TwitchApi.Client

  test "new/1 raises ArgumentError when nil :client_id" do
    error = ~r/^:client_id not set or is empty$/
    auth = %{client_id: nil, client_secret: "whereisid"}
    assert_raise ArgumentError, error, fn -> TwitchApi.Client.new(auth) end
  end

  test "new/1 raises ArgumentError when empty :client_id" do
    error = ~r/^:client_id not set or is empty$/
    auth = %{client_id: "", client_secret: "whereisid"}
    assert_raise ArgumentError, error, fn -> TwitchApi.Client.new(auth) end
  end

  test "new/1 raises ArgumentError when nil :client_secret" do
    error = ~r/^:client_secret not set or is empty$/
    auth = %{client_id: "whereissecret", client_secret: nil}
    assert_raise ArgumentError, error, fn -> TwitchApi.Client.new(auth) end
  end

  test "new/1 raises ArgumentError when empty :client_secret" do
    error = ~r/^:client_secret not set or is empty$/
    auth = %{client_id: "whereissecret", client_secret: ""}
    assert_raise ArgumentError, error, fn -> TwitchApi.Client.new(auth) end
  end
end
