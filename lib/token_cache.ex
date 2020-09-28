defmodule TwitchApi.TokenCache do
  @moduledoc """
  Handles holding tokens for client credential bearer auth
  """

  alias TwitchApi.Client
  alias TwitchApi.ID.OAuth.Token

  @doc """
  Gets a value from the `store`.
  """
  def get do
    case Cachex.get(:token_cache, "token") do
      {:ok, nil} ->
        res =
          Client.new()
          |> Token.post()

        token = res.body["access_token"]
        expiry = res.body["expires_in"]

        case put(token, expiry) do
          {:ok, true} -> {:ok, token}
          {:ok, false} -> {:error, "Could not put token"}
        end

      {:ok, value} ->
        {:ok, value}

      {:error, error} ->
        {:error, error}

      _ ->
        {:error, "Token cache had an issue"}
    end
  end

  @doc """
  Puts the `value` for the given `key` in the `store`.
  """
  def put(value, ttl \\ 5000) do
    Cachex.put(:token_cache, "token", value, ttl: :timer.seconds(ttl))
  end

  @doc """
  Purges the cache
  """
  def purge do
    Cachex.del(:token_cache, "token")
  end
end
