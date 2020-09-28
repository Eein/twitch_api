defmodule TwitchApi.HelixTest do
  use ExUnit.Case
  alias TwitchApi.Helix

  test "returns the correct endpoint" do
    assert Helix.endpoint() == "https://api.twitch.tv"
  end

  test "returns the correct url given a prop" do
    assert Helix.url("users") == "https://api.twitch.tv/helix/users"
  end
end
