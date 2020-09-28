defmodule TwitchApi.IDTest do
  use ExUnit.Case
  alias TwitchApi.ID

  test "returns the correct endpoint" do
    assert ID.endpoint() == "https://id.twitch.tv"
  end

  test "returns the correct url given a prop" do
    assert ID.url("oauth2") == "https://id.twitch.tv/oauth2"
  end
end
