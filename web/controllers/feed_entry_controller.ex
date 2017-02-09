defmodule Upfeed.FeedEntryController do
  use Upfeed.Web, :controller

  def index(conn, %{"feed" => feed_name}) do
    case Upfeed.Feed.files(feed_name) do
      {:ok, filenames} ->
        conn
        |> put_layout(:none)
        |> put_resp_content_type("application/xml")
        |> render("index.xml", items: filenames, feed_name: feed_name)
      {:error, :enoent} ->
        conn
        |> put_status(404)
        |> put_view(Upfeed.ErrorView)
        |> render("404.html")
      end
  end

  def show(conn, %{"feed" => feed_name, "file" => filename}) do
    path = Upfeed.Feed.file_path(feed_name, filename)

    if File.exists?(path) do
      conn
      |> put_resp_header("content-disposition", ~s(attachment; filename="#{filename}"))
      |> send_file(200, path)
    else
      conn
      |> put_status(404)
      |> put_view(Upfeed.ErrorView)
      |> render("404.html")
    end
  end
end
