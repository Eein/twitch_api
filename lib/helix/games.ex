defmodule TwitchApi.Helix.Games do
  alias TwitchApi.Client

  @moduledoc """
  Gets information about games and the streamers playing them on twitch
  """

  @path "games"

  @doc """
  Gets game information by game ID or name.

  [https://dev.twitch.tv/docs/api/reference#get-games](https://dev.twitch.tv/docs/api/reference#get-games)

  ## Examples
  ```elixir
  TwitchApi.Helix.Games.get(client)
  TwitchApi.Helix.Games.get(client, %{id: 21779})
  TwitchApi.Helix.Games.get(client, %{id: [21779, 493057]})

  ```

  If you are attempting to query multiple games (up to 100), you can
  pass a list to the properly you want.

  ## Examples

  ```elixir
  TwitchApi.Helix.Games.get(client, %{
      id: [123, 342, 929, 100]
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
    iex> TwitchApi.Helix.Games.url()
    "https://api.twitch.tv/helix/games"
  """

  def url, do: TwitchApi.Helix.url(@path)
end
