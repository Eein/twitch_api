defmodule Helix.Webhooks.Subscriptions do
  alias Helix.Client

  @moduledoc """
  Gets the Webhook subscriptions of a user identified by a Bearer token.
  """

  @url "webhooks/subscriptions"

  @doc """
  Gets information about subscribed webhooks.

  [https://dev.twitch.tv/docs/api/reference#get-webhook-subscriptions](https://dev.twitch.tv/docs/api/reference#get-webhook-subscriptions)

  ## Authentication

  App access token

  ## Examples
  ```elixir
  Helix.Webhooks.Subscriptions.get(client, %{
      first: 10,
      before: "eyJiIjpudWxsLCJhIjp7IkN1cnNvciI6IiJ9fQ"
    }
  )
  Helix.Webhooks.Subscriptions.get(client, %{
      after: "eyJiIjpudWxsLCJhIjp7IkN1cnNvciI6IiJ9fQ"
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
    iex> Helix.Webhooks.Subscriptions.url()
    "https://api.twitch.tv/helix/webhooks/subscriptions"
  """

  def url, do: Helix.process_request_url(@url)
end
