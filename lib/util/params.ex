defmodule Helix.Util.Params do
  @moduledoc false
  def params_list_query_stringify(key, list) do
    Enum.with_index(list)
    |> Enum.map(fn {v, i} ->
      "#{key}=#{v}"
    end)
    |> Enum.join("&")
  end

  def url_params_list_parser(url, params) do
    if params !== %{} do
      p =
        params
        |> Enum.map(fn {k, v} ->
          if is_list(v) do
            params_list_query_stringify(k, v)
          else
            "#{k}=#{v}"
          end
        end)
        |> Enum.join("&")

      "#{url}?#{p}"
    else
      url
    end
  end
end
