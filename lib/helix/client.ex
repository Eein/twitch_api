defmodule Helix.Client do
  alias Helix.Util.Params

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
  Helix.Client.new()
  => %Helix.Client{
    auth: %{client_id: "ABC123", client_secret: "DEF456"}
  }
  ```
  """

  @spec new() :: t
  def new do
    auth = %{
      client_id: Application.fetch_env!(:helix, :client_id),
      client_secret: Application.fetch_env!(:helix, :client_secret)
    }

    new(auth)
  end

  @doc """
  Explicitly takes a client id and secret and returns a `%Helix.Client{}`.
  This is useful if you have many services that require different
  credentials, or if you are using elixir umbrellas.

  ## Examples
      iex> Helix.Client.new(%{client_id: "ABC123", client_secret: "DEF456"})
      %Helix.Client{
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

  def get(client = %Helix.Client{}, path, headers, params) do
    url = Params.url_params_list_parser(path, params)
    headers = [{"Client-ID", client.auth.client_id} | headers]
    Helix.get!(url, headers)
  end
end
