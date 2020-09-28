defmodule TwitchApi do
  use HTTPoison.Base

  # @endpoint "https://api.twitch.tv"

  @moduledoc """
  API for the New Twitch API (TwitchApi)
  """

  #   def process_request_url(url) do
  #     endpoint = Application.get_env(:twitch_api, :url) || @endpoint
  #     "#{endpoint}/#{url}"
  #   end

  def process_request_headers(headers) do
    [
      {"Content-Type", "application/json"}
    ] ++ headers
  end

  def process_response_body(body) do
    body
    |> Jason.decode!()
  end
end
