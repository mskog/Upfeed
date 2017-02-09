defmodule Upfeed.Feed do
  def files(feed_name) do
    Path.join(["uploads", feed_name])
    |> File.ls
  end

  def file_path(feed_name, filename) do
    Path.join(["uploads", feed_name, filename])
  end
end
