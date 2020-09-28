defmodule TwitchApi.Helix do
  @moduledoc """
  Twitch Api ID Endpoints
  """

  def endpoint do
    Application.get_env(:twitch_api, :helix_endpoint)
  end

  def url(path) do
    "#{endpoint}/helix/#{path}"
  end
end
