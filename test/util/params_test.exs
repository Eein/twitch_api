defmodule TwitchApi.Util.ParamsTest do
  use ExUnit.Case, async: true
  alias TwitchApi.Util.Params

  test "params_list_query_stringify/2 changes list of id with list of ids to query" do
    string = Params.params_list_query_stringify(:id, [123, 146, 283])
    assert string == "id=123&id=146&id=283"
  end

  test "url_params_list_parser/1 changes ids to id with list of ids" do
    path = "games/top"
    url = Params.url_params_list_parser(path, %{id: [123, 146, 283], before: "444"})
    assert url == "games/top?before=444&id=123&id=146&id=283"
  end
end
