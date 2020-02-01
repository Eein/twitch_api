defmodule Helix.Streams do
  alias Helix.Client

  def get(client = %Helix.Client{}, params \\ %{}) do
    Client.get(client, "streams", [], params)
  end
end
