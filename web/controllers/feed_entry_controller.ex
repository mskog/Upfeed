defmodule Upfeed.FeedEntryController do
  use Upfeed.Web, :controller

  def index(conn, %{"feed" => feed_name}) do
    case Path.join(["uploads", feed_name]) |> File.ls do
      {:ok, filenames} ->
        conn
        |> put_layout(:none)
        |> put_resp_content_type("application/xml")
        |> render("index.xml", items: filenames, feed_name: feed_name)
      {:error, :enoent} ->
        conn
        |> put_status(404)
        |> text("404")
    end
  end

  def show(conn, %{"feed" => feed_name, "file" => filename}) do
    path = Path.join(["uploads", feed_name, filename])

    conn 
    |> put_resp_header("content-disposition", 
                       ~s(attachment; filename="#{filename}"))
    |> send_file(200, path)
  end
end
