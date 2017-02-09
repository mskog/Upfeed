defmodule Upfeed.FeedEntryControllerTest do
  use Upfeed.ConnCase

  describe "index/2" do
    test "Not found" do
      response = build_conn
      |> get("/nothin")

      assert html_response(response, 404) =~ "Page not found"
    end

    test "With entries" do
      response = build_conn
      |> get(feed_entry_path(build_conn, :index, "foobar"))

      {:ok, feed, _} = FeederEx.parse(response.resp_body)
      first_entry = List.first(feed.entries)

      assert feed.title == "Upfeed - foobar"
      assert feed.summary == "Upfeed - foobar"
      assert feed.link =~ feed_entry_path(build_conn, :index, "foobar")
      assert Enum.count(feed.entries) == 1
      assert first_entry.title == "bird.jpeg"
      assert first_entry.link =~ feed_entry_path(build_conn, :show, "foobar", "bird.jpeg")
    end
  end

  describe "show/2" do
    test "Not found" do
      response = build_conn
      |> get("/nothin/nobird.jpeg")

      assert html_response(response, 404) =~ "Page not found"
    end

    test "With an entry" do
      response = build_conn
      |> get(feed_entry_path(build_conn, :show, "foobar", "bird.jpeg"))
      {:ok, data} = File.read("test/fixtures/uploads/foobar/bird.jpeg")

      assert response.resp_body == data
    end
  end
end
