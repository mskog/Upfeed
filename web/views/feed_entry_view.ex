defmodule Upfeed.FeedEntryView do
  use Upfeed.Web, :view

  def feed_title(feed_name) do
    "Upfeed - #{feed_name}"
  end

  def feed_description(feed_name) do
    feed_title(feed_name)
  end
end
