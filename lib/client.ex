defmodule TwitchApi.Client do
  alias TwitchApi.Util.Params

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
  @type t :: %__MODULE__{auth: auth | nil}

  defstruct auth: nil

  @doc """
  If using configuration; takes /0 and returns a client

  ## Examples
  ```elixir
  TwitchApi.Client.new()
  => %TwitchApi.Client{
    auth: %{client_id: "ABC123", client_secret: "DEF456"}
  }
  ```
  """

  @spec new() :: t
  def new do
    auth = %{
      client_id: Application.fetch_env!(:twitch_api, :client_id),
      client_secret: Application.fetch_env!(:twitch_api, :client_secret)
    }

    new(auth)
  end

  @doc """
  Explicitly takes a client id and secret and returns a `%TwitchApi.Client{}`.
  This is useful if you have many services that require different
  credentials, or if you are using elixir umbrellas.

  ## Examples
      iex> TwitchApi.Client.new(%{client_id: "ABC123", client_secret: "DEF456"})
      %TwitchApi.Client{
        auth: %{client_id: "ABC123", client_secret: "DEF456"}
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

      {_id, _secret} ->
        %__MODULE__{auth: auth}
    end
  end

  def get(client, path \\ "", headers \\ [], params \\ %{})

  def get(client = %TwitchApi.Client{}, path, headers, params) do
    url = Params.url_params_list_parser(path, params)
    {:ok, token} = TwitchApi.TokenCache.get()

    headers = [{"Client-ID", "#{client.auth.client_id}"} | headers]
    headers = [{"Authorization", "Bearer #{token}"} | headers]
    TwitchApi.get!(url, headers)
  end

  def post(client, path \\ "", body \\ "", headers \\ [])

  def post(client = %TwitchApi.Client{}, path, body, headers) do
    url = Params.url_params_list_parser(path, %{})
    # {:ok, token} = TwitchApi.TokenCache.get()

    headers = [{"Client-ID", "#{client.auth.client_id}"} | headers]
    # headers = [{"Authorization", "Bearer #{token}"} | headers]
    TwitchApi.post!(url, body, headers)
  end
end
