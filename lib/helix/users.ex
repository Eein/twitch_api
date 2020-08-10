defmodule Helix.Users do
  alias Helix.Client

  @moduledoc """
  Gets information about users on twitch
  """

  @url "helix/users"

  @doc """
  Gets information about one or more specified Twitch users.
  Users are identified by optional user IDs and/or login name.
  If neither a user ID nor a login name is specified, the user
  is looked up by Bearer token.

  [https://dev.twitch.tv/docs/api/reference#get-users](https://dev.twitch.tv/docs/api/reference#get-users)

  ## Examples
  ```elixir
  Helix.Users.get(client)
  Helix.Users.get(client, %{
      first: 25,
      before: "eyJzIjoyMCwiZCI6ZmFsc2UsInQiOnRydWV9"
    }
  )
  Helix.Users.get(client, %{
      after: "eyJzIjoyMCwiZCI6ZmFsc2UsInQiOnRydWV9"
    }
  )

  ```

  If you are attempting to query multiple users (up to 100), you can
  pass a list to the properly you want.

  ## Examples
  ```elixir
  Helix.Users.get(client, %{
      id: [123, 342, 929, 100]
    }
  )
  Helix.Users.get(client, %{
      login: ["kappa", "ted", "bobross"]
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
    iex> Helix.Users.url()
    "https://api.twitch.tv/helix/users"
  """

  def url, do: Helix.process_request_url(@url)
end
