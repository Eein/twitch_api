defmodule TwitchApi.Helix.Webhooks.Hub do
  alias TwitchApi.Client

  @moduledoc """
  Handles subscription and unsubscription to twitch webhooks hub
  """

  @path "webhooks/hub"
  @webhook_callback Application.get_env(:twitch_api, :webhook_callback_url)

  def subscribe(client, resource, callback \\ @webhook_callback, lease \\ 864_000) do
    case callback do
      nil ->
        raise "Missing webhook callback url, please add one or specify in your config"

      _ ->
        Client.post(client, url(), [], %{
          "hub.callback" => callback,
          "hub.mode" => "subscribe",
          "hub.topic" => resource,
          "hub.lease_seconds" => lease
        })
    end
  end

  def unsubscribe(client, resource, callback \\ @webhook_callback, lease \\ 864_000) do
    case callback do
      nil ->
        raise "Missing webhook callback url, please add one or specify in your config"

      _ ->
        Client.post(client, url(), [], %{
          "hub.callback" => callback,
          "hub.mode" => "unsubscribe",
          "hub.topic" => resource,
          "hub.lease_seconds" => lease
        })
    end
  end

  @doc """
  Gets the endpoint url for this resource

  ## Examples
    iex> TwitchApi.Helix.Webhooks.url()
    "https://api.twitch.tv/helix/webhooks/hub"
  """

  def url, do: TwitchApi.Helix.url(@path)
end
