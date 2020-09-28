defmodule TwitchApi.ID.OAuth.Token do
  @moduledoc """
  For interaction with id.twitch.tv
  """

  alias TwitchApi.ID

  @path "oauth2/token"

  @doc """
  Gets a app oauth token via client credentials flow and stores in ets cache for reuse

  [https://dev.twitch.tv/docs/authentication/getting-tokens-oauth#oauth-client-credentials-flow](https://dev.twitch.tv/docs/authentication/getting-tokens-oauth#oauth-client-credentials-flow)

  ```
  """
  def post(client = %TwitchApi.Client{}, _params \\ %{}) do
    query =
      %{
        client_id: Application.get_env(:twitch_api, :client_id),
        client_secret: Application.get_env(:twitch_api, :client_secret),
        grant_type: "client_credentials"
      }
      |> URI.encode_query()

    uri = "#{url()}?#{query}"

    headers = [{"Client-ID", "#{client.auth.client_id}"}]
    TwitchApi.post!(uri, "", headers)
  end

  @doc """
  Gets the endpoint url for this resource

  ## Examples
    iex> TwitchApi.ID.OAuth.Token.url()
    "https://id.twitch.tv/oauth2/token"
  """

  def url, do: ID.url(@path)
end
