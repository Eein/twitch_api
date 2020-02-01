defmodule Helix.Users do
  alias Helix.Client

  @moduledoc """
  Gets information about users on twitch
  """

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
    Client.get(client, "users", [], params)
  end

  @doc """
  Gets information on follow relationships between two Twitch users.
  Information returned is sorted in order, most recent follow first.
  This can return information like “who is lirik following,”
  “who is following lirik,” or “is user X following user Y.”

  [https://dev.twitch.tv/docs/api/reference#get-users-follows](https://dev.twitch.tv/docs/api/reference#get-users-follows)

  ## Examples
  ```elixir
  Helix.Users.get_follows(client, %{
      to_id: 23161357
    }
  )
  Helix.Users.get_follows(client, %{
      from_id: 23161357
    }
  )
  ```
  """

  def get_follows(client = %Helix.Client{}, params \\ %{}) do
    if Map.has_key?(params, :to_id) or Map.has_key?(params, :from_id) do
      Client.get(client, "users/follows", [], params)
    else
      raise "This endpoint requires from_id and/or to_id params to be valid"
    end
  end
end
