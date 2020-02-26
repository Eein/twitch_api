defmodule Helix.Games do
  alias Helix.Client

  @url "games"

  @doc """
  Gets game information by game ID or name.

  [https://dev.twitch.tv/docs/api/reference#get-games](https://dev.twitch.tv/docs/api/reference#get-games)

  ## Examples
  ```elixir
  Helix.Games.get(client)
  Helix.Games.get(client, %{id: 21779})
  Helix.Games.get(client, %{id: [21779, 493057]})

  ```

  If you are attempting to query multiple games (up to 100), you can
  pass a list to the properly you want.

  ## Examples

  ```elixir
  Helix.Games.get(client, %{
      id: [123, 342, 929, 100]
    }
  )
  ```
  """

  def get(client = %Helix.Client{}, params \\ %{}) do
    Client.get(client, @url, [], params)
  end

  @doc """
  Gets the endpoint url for this resource

  ## Examples
    iex> Helix.Games.url()
    "https://api.twitch.tv/helix/games"
  """

  def url(), do: Helix.process_request_url(@url)
end
