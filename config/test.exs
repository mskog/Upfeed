use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :upfeed, Upfeed.Endpoint,
  http: [port: 4001],
  server: false

config :upfeed,
  storage_dir: 'test/fixtures/uploads'

# Print only warnings and errors during test
config :logger, level: :warn

