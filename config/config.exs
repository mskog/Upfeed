# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :upfeed, Upfeed.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "XElF64T9b5mFqR/0EUjAJJeqjcNgl/qCJDn7eCZEXDKl+pbju/0RrfSU6/aNOnT+",
  render_errors: [view: Upfeed.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Upfeed.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :arc,
  storage: Arc.Storage.Local

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
