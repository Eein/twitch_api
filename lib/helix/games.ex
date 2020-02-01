defmodule Helix.Games do
  alias Helix.Client

  @moduledoc """
  Gets information about games and the streamers playing them on twitch
  """

  @doc """
  Gets games sorted by number of current viewers on Twitch, most popular first.

  [https://dev.twitch.tv/docs/api/reference#get-top-games](https://dev.twitch.tv/docs/api/reference#get-top-games)

  ## Examples
  ```elixir
  Helix.Games.get_top(client)
  Helix.Games.get_top(client, %{
      first: 25,
      before: "eyJzIjoyMCwiZCI6ZmFsc2UsInQiOnRydWV9"
    }
  )
  Helix.Games.get_top(client, %{
      after: "eyJzIjoyMCwiZCI6ZmFsc2UsInQiOnRydWV9"
    }
  )

  ```
  """

  def get_top(client = %Helix.Client{}, params \\ %{}) do
    Client.get(client, "games/top", [], params)
  end

  @doc """
  Gets game information by game ID or name.

  [https://dev.twitch.tv/docs/api/reference#get-games](https://dev.twitch.tv/docs/api/reference#get-games)

  ## Examples
  ```elixir
  Helix.Games.get(client)
  Helix.Games.get(client, %{id: 21779})
  Helix.Games.get(client, %{id: [21779, 493057]})

  ```
  """

  def get(client = %Helix.Client{}, params \\ %{}) do
    Client.get(client, "games", [], params)
  end
end
