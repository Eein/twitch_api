defmodule Helix do
  use HTTPoison.Base

  @endpoint "https://api.twitch.tv"

  @moduledoc """
  API for the New Twitch API (Helix)
  """

  def process_request_url(url) do
    endpoint = Application.get_env(:helix, :url) || @endpoint
    "#{endpoint}/#{url}"
  end

  def process_request_headers(headers) do
    [
      {"Content-Type", "application/json"},
      {"Client-ID", Application.get_env(:helix, :client_id)}
    ] ++ headers
  end

  def process_response_body(body) do
    body
    |> Jason.decode!()
  end
end
