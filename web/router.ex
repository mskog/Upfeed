defmodule Upfeed.Router do
  use Upfeed.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Upfeed do
    pipe_through :browser # Use the default browser stack

    get "/:feed", FeedEntryController, :index
    get "/:feed/:file", FeedEntryController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", Upfeed do
  #   pipe_through :api
  # end
end
