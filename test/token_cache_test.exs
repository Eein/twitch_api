defmodule TwitchApi.TokenCacheTest do
  use ExUnit.Case
  alias TwitchApi.TokenCache

  setup do
    TokenCache.purge()

    on_exit(fn ->
      TokenCache.purge()
    end)
  end

  test "get/0 sets a token if one doesn't exist" do
    {:ok, token} = TokenCache.get()
    assert token != nil
  end

  test "get/0 sets a token and we check that expiry is greater than 5k" do
    {:ok, token} = TokenCache.get()
    {:ok, ttl} = Cachex.ttl(:token_cache, "token")
    assert token != nil
    assert ttl > 5000
  end

  test "put/1 sets a token" do
    TokenCache.put("abc123")
    {:ok, token} = TokenCache.get()
    assert token == "abc123"
  end

  test "purge/0 purges the cache token" do
    TokenCache.put("123abc")
    assert {:ok, token} = Cachex.get(:token_cache, "token")
    assert token == "123abc"

    {:ok, true} = TokenCache.purge()
    assert {:ok, token} = Cachex.get(:token_cache, "token")
    assert token == nil
  end
end
