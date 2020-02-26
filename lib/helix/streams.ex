defmodule Helix.Streams do
  alias Helix.Client

  @moduledoc """
  Gets information about streams on twitch
  """

  @url "streams"

  @doc """
  Gets information about active streams. Streams are returned
  sorted by number of current viewers, in descending order.

  [https://dev.twitch.tv/docs/api/reference#get-streams](https://dev.twitch.tv/docs/api/reference#get-streams)

  ## Examples
  ```elixir
  Helix.Streams.get(client)
  Helix.Streams.get(client, %{
      first: 25,
      before: "eyJzIjoyMCwiZCI6ZmFsc2UsInQiOnRydWV9"
    }
  )
  Helix.Streams.get(client, %{
      after: "eyJzIjoyMCwiZCI6ZmFsc2UsInQiOnRydWV9"
    }
  )

  ```

  If you are attempting to query multiple streams (up to 100), you can
  pass a list to the properly you want.

  ## Examples
  ```elixir
  Helix.Streams.get(client, %{
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
    iex> Helix.Streams.url()
    "https://api.twitch.tv/helix/streams"
  """

  def url(), do: Helix.process_request_url(@url)
end
