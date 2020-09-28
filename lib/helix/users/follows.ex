defmodule TwitchApi.Helix.Users.Follows do
  alias TwitchApi.Client

  @moduledoc """
  Gets information about users following on twitch
  """

  @path "users/follows"

  @doc """
  Gets information on follow relationships between two Twitch users.
  Information returned is sorted in order, most recent follow first.
  This can return information like “who is lirik following,”
  “who is following lirik,” or “is user X following user Y.”

  [https://dev.twitch.tv/docs/api/reference#get-users-follows](https://dev.twitch.tv/docs/api/reference#get-users-follows)

  ## Examples
  ```elixir
  TwitchApi.Helix.Users.Follows.get(client, %{
      to_id: 23161357
    }
  )
  TwitchApi.Helix.Users.Follows.get(client, %{
      from_id: 23161357
    }
  )
  ```
  """

  def get(client = %TwitchApi.Client{}, params \\ %{}) do
    if Map.has_key?(params, :to_id) or Map.has_key?(params, :from_id) do
      Client.get(client, url(), [], params)
    else
      raise "This endpoint requires from_id and/or to_id params to be valid"
    end
  end

  @doc """
  Gets the endpoint url for this resource

  ## Examples
    iex> TwitchApi.Helix.Users.Follows.url()
    "https://api.twitch.tv/helix/users/follows"
  """

  def url, do: TwitchApi.Helix.url(@path)
end
