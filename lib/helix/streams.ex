defmodule TwitchApi.Helix.Streams do
  alias TwitchApi.Client

  @moduledoc """
  Gets information about streams on twitch
  """

  @path "streams"

  @doc """
  Gets information about active streams. Streams are returned
  sorted by number of current viewers, in descending order.

  [https://dev.twitch.tv/docs/api/reference#get-streams](https://dev.twitch.tv/docs/api/reference#get-streams)

  ## Examples
  ```elixir
  TwitchApi.Helix.Streams.get(client)
  TwitchApi.Helix.Streams.get(client, %{
      first: 25,
      before: "eyJzIjoyMCwiZCI6ZmFsc2UsInQiOnRydWV9"
    }
  )
  TwitchApi.Helix.Streams.get(client, %{
      after: "eyJzIjoyMCwiZCI6ZmFsc2UsInQiOnRydWV9"
    }
  )

  ```

  If you are attempting to query multiple streams (up to 100), you can
  pass a list to the properly you want.

  ## Examples
  ```elixir
  TwitchApi.Helix.Streams.get(client, %{
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
    iex> TwitchApi.Helix.Streams.url()
    "https://api.twitch.tv/helix/streams"
  """

  def url, do: TwitchApi.Helix.url(@path)
end
