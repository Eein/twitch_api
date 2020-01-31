defmodule Twitch.Client do
  @moduledoc """
  Builds the client for the API wrapper
  """

  @typedoc """
  Credentials for authorization
  """
  @type auth :: %{client_id: String.t(), access_token: String.t()}

  @typedoc """
  The client struct
  """
  @type t :: %__MODULE__{auth: auth | nil, endpoint: String.t()}

  defstruct auth: nil, endpoint: "https://api.twitch.tv/helix/"

  @doc """
  Parses an hash of type `auth` into a client

  ## Examples
      iex> Twitch.Client.new(%{client_id: "ABC123", access_token: "DEF456"})
      %Twitch.Client{
        auth: %{client_id: "ABC123", access_token: "DEF456"},
        endpoint: "https://api.twitch.tv/helix/"
      }
  """

  @spec new(auth) :: t
  def new(auth = %{client_id: _, access_token: _}) do
    %__MODULE__{auth: auth}
  end
end
