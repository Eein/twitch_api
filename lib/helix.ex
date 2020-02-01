defmodule Helix do
  use HTTPoison.Base

  @endpoint "https://api.twitch.tv"

  @moduledoc """
  API for the New Twitch API (Helix)
  """

  def process_url(url) do
    endpoint = Application.get_env(:helix, :url) || @endpoint
    endpoint <> "/helix/" <> url
  end

  def process_response_body(body) do
    body
    |> Jason.decode!()
  end
end