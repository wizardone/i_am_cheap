# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :i_am_cheap,
  ecto_repos: [IAmCheap.Repo]

# Configures the endpoint
config :i_am_cheap, IAmCheap.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "WQb8kYixCmCnqWJPiA8DpwgpQd9VA1pMFD6gERsfX8lWvV7IeGPQCK38WE0qF5DZ",
  render_errors: [view: IAmCheap.ErrorView, accepts: ~w(html json)],
  pubsub: [name: IAmCheap.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
