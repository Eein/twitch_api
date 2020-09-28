defmodule TwitchApi.Helix.Users do
  alias TwitchApi.Client

  @moduledoc """
  Gets information about users on twitch
  """

  @path "users"

  @doc """
  Gets information about one or more specified Twitch users.
  Users are identified by optional user IDs and/or login name.
  If neither a user ID nor a login name is specified, the user
  is looked up by Bearer token.

  [https://dev.twitch.tv/docs/api/reference#get-users](https://dev.twitch.tv/docs/api/reference#get-users)

  ## Examples
  ```elixir
  TwitchApi.Helix.Users.get(client)
  TwitchApi.Helix.Users.get(client, %{
      first: 25,
      before: "eyJzIjoyMCwiZCI6ZmFsc2UsInQiOnRydWV9"
    }
  )
  TwitchApi.Helix.Users.get(client, %{
      after: "eyJzIjoyMCwiZCI6ZmFsc2UsInQiOnRydWV9"
    }
  )

  ```

  If you are attempting to query multiple users (up to 100), you can
  pass a list to the properly you want.

  ## Examples
  ```elixir
  TwitchApi.Helix.Users.get(client, %{
      id: [123, 342, 929, 100]
    }
  )
  TwitchApi.Helix.Users.get(client, %{
      login: ["kappa", "ted", "bobross"]
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
    iex> TwitchApi.Helix.Users.url()
    "https://api.twitch.tv/helix/users"
  """

  def url, do: TwitchApi.Helix.url(@path)
end
