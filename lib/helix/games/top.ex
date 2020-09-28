defmodule TwitchApi.Helix.Games.Top do
  alias TwitchApi.Client

  @moduledoc """
  Gets information about the top games and the streamers playing them on twitch
  """

  @path "games/top"

  @doc """
  Gets games sorted by number of current viewers on Twitch, most popular first.

  [https://dev.twitch.tv/docs/api/reference#get-top-games](https://dev.twitch.tv/docs/api/reference#get-top-games)

  ## Examples
  ```elixir
  TwitchApi.Helix.Games.Top.get(client)
  TwitchApi.Helix.Games.Top.get(client, %{
      first: 25,
      before: "eyJzIjoyMCwiZCI6ZmFsc2UsInQiOnRydWV9"
    }
  )
  TwitchApi.Helix.Games.Top.get(client, %{
      after: "eyJzIjoyMCwiZCI6ZmFsc2UsInQiOnRydWV9"
    }
  )

  ```
  """

  def get(client = %TwitchApi.Client{}, params \\ %{}) do
    Client.get(client, url(), [], params)
  end

  @doc """
  Gets the endpoint url for this resource

  ## Examples
    iex> TwitchApi.Helix.Games.Top.url()
    "https://api.twitch.tv/helix/games/top"
  """

  def url, do: TwitchApi.Helix.url(@path)
end
