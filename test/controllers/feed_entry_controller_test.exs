defmodule Upfeed.FeedEntryControllerTest do
  use Upfeed.ConnCase

  test "GET /:feed Not found", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 404) =~ "Page not found"
  end
end
