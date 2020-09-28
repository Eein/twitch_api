defmodule TwitchApi.Helix.Webhooks.Subscriptions do
  alias TwitchApi.Client

  @moduledoc """
  Gets the Webhook subscriptions of a user identified by a Bearer token.
  """

  @url "helix/webhooks/subscriptions"

  @doc """
  Gets information about subscribed webhooks.

  [https://dev.twitch.tv/docs/api/reference#get-webhook-subscriptions](https://dev.twitch.tv/docs/api/reference#get-webhook-subscriptions)

  ## Authentication

  App access token

  ## Examples
  ```elixir
  TwitchApi.Helix.Webhooks.Subscriptions.get(client, %{
      first: 10,
      before: "eyJiIjpudWxsLCJhIjp7IkN1cnNvciI6IiJ9fQ"
    }
  )
  TwitchApi.Helix.Webhooks.Subscriptions.get(client, %{
      after: "eyJiIjpudWxsLCJhIjp7IkN1cnNvciI6IiJ9fQ"
    }
  )

  ```
  """
  def get(client = %TwitchApi.Client{}, params \\ %{}) do
    Client.get(client, @url, [], params)
  end

  @doc """
  Gets the endpoint url for this resource

  ## Examples
    iex> TwitchApi.Helix.Webhooks.Subscriptions.url()
    "https://api.twitch.tv/helix/webhooks/subscriptions"
  """

  def url, do: TwitchApi.process_request_url(@url)
end
