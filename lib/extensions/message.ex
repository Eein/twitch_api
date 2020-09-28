defmodule TwitchApi.Extensions.Message do
  alias TwitchApi.Client

  @moduledoc """
  Methods for interacting with the extensions API
  """

  @url "extensions/message"

  @doc """
  Twitch provides a publish-subscribe system for your EBS to communicate with both the broadcaster and viewers. Calling this endpoint forwards your message using the same mechanism as the send JavaScript helper function. A message can be sent to either a specified channel or globally (all channels on which your extension is active).

  Authentication
  Signed JWT (Twitch or EBS JWTs are allowed)

  Note: Your signed JWT must include the channel_id and pubsub_perms fields, documented in JWT Schema. For example, to send to a channel:

  [https://dev.twitch.tv/docs/extensions/reference#send-extension-pubsub-message](https://dev.twitch.tv/docs/extensions/reference#send-extension-pubsub-message)

  ## Examples
  ```elixir
  TwitchApi.Helix.Extensions.Message.post(client, %{
    channel_id => 123,
    message: %{anything: "youd like"}
  })
  => 204 Success
  ```
  """

  def post(client = %TwitchApi.Client{}, body \\ "", params \\ []) do
    Client.post(client, @url, body, params)
  end

  @doc """
  Gets the endpoint url for this resource

  ## Examples
    iex> TwitchApi.Extensions.Message.url(%{id:)
    "https://api.twitch.tv/extensions/message/top"
  """

  def url, do: TwitchApi.process_request_url(@url)
end
