defmodule Helix.Webhook do
  alias Helix.Client

  @moduledoc """
  Handles subscription and unsubscription to twitch webhooks hub
  """

  @url "webhooks/hub"

  def subscribe(client, callback, resource, lease \\ 864_000) do
    Client.post(client, @url, [], %{
      "hub.callback" => callback,
      "hub.mode" => "subscribe",
      "hub.topic" => resource,
      "hub.lease_seconds" => lease
    })
  end

  def unsubscribe(client, callback, resource, lease \\ 864_000) do
    Client.post(client, @url, [], %{
      "hub.callback" => callback,
      "hub.mode" => "unsubscribe",
      "hub.topic" => resource,
      "hub.lease_seconds" => lease
    })
  end
end
