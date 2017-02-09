defmodule Upfeed.Feed do
  @storage_dir Application.get_env(:upfeed, :storage_dir)

  def files(feed_name) do
    Path.join([@storage_dir, feed_name])
    |> File.ls
  end

  def file_path(feed_name, filename) do
    Path.join([@storage_dir, feed_name, filename])
  end
end
