defmodule Helix.Client do
  @moduledoc """
  Builds the client for the API wrapper
  """

  @typedoc """
  Credentials
  """
  @type auth :: %{client_id: String.t(), client_secret: String.t()}

  @typedoc """
  The client struct
  """
  @type t :: %__MODULE__{auth: auth | nil, endpoint: String.t()}

  defstruct auth: nil, endpoint: "https://api.twitch.tv/helix/"

  @doc """
  If using environment variables; takes /0 and returns a client

  ## Examples
      iex> System.put_env("TWITCH_CLIENT_ID", "ABC123")
      iex> System.put_env("TWITCH_CLIENT_SECRET", "DEF456")
      iex> Helix.Client.new()
      %Helix.Client{
        auth: %{client_id: "ABC123", client_secret: "DEF456"},
        endpoint: "https://api.twitch.tv/helix/"
      }
  """

  @spec new() :: t
  def new do
    auth = %{
      client_id: System.fetch_env!("TWITCH_CLIENT_ID"),
      client_secret: System.fetch_env!("TWITCH_CLIENT_SECRET")
    }

    new(auth)
  end

  @doc """
  Explicitly takes a client id and secret and returns a %Helix.Client{}.
  This is useful if you have many services that require different
  credentials, or if you are using elixir umbrellas.

  ## Examples
      iex> Helix.Client.new(%{client_id: "ABC123", client_secret: "DEF456"})
      %Helix.Client{
        auth: %{client_id: "ABC123", client_secret: "DEF456"},
        endpoint: "https://api.twitch.tv/helix/"
      }
  """

  @spec new(auth) :: t

  def new(auth = %{client_id: id, client_secret: secret}) do
    case {id, secret} do
      {nil, _} ->
        raise ArgumentError, message: ":client_id not set or is empty"

      {_, nil} ->
        raise ArgumentError, message: ":client_secret not set or is empty"

      {"", _} ->
        raise ArgumentError, message: ":client_id not set or is empty"

      {_, ""} ->
        raise ArgumentError, message: ":client_secret not set or is empty"

      {id, secret} ->
        case System.get_env("TWITCH_ENDPOINT") do
          nil -> %__MODULE__{auth: auth}
          endpoint -> %__MODULE__{auth: auth, endpoint: endpoint}
        end
    end
  end
end
