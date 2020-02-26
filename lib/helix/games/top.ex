defmodule Helix.Games.Top do
  alias Helix.Client

  @moduledoc """
  Gets information about games and the streamers playing them on twitch
  """

  @url "games/top"

  @doc """
  Gets games sorted by number of current viewers on Twitch, most popular first.

  [https://dev.twitch.tv/docs/api/reference#get-top-games](https://dev.twitch.tv/docs/api/reference#get-top-games)

  ## Examples
  ```elixir
  Helix.Games.Top.get(client)
  Helix.Games.Top.get(client, %{
      first: 25,
      before: "eyJzIjoyMCwiZCI6ZmFsc2UsInQiOnRydWV9"
    }
  )
  Helix.Games.Top.get(client, %{
      after: "eyJzIjoyMCwiZCI6ZmFsc2UsInQiOnRydWV9"
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
    iex> Helix.Games.Top.url()
    "https://api.twitch.tv/helix/games/top"
  """

  def url(), do: Helix.process_request_url(@url)
end
