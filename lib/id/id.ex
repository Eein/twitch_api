defmodule TwitchApi.ID do
  @moduledoc """
  Twitch Api ID Endpoints
  """

  def endpoint do
    Application.get_env(:twitch_api, :id_endpoint)
  end

  def url(path) do
    "#{endpoint()}/#{path}"
  end
end
