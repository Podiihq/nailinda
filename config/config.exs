# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :nailinda,
  ecto_repos: [Nailinda.Repo]

# Configures the endpoint
config :nailinda, NailindaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "zRi2EO0kce+B9C6aZYn2vqiP4bgBgWLXtmB2cHBKLoPrZ8i1llszwfpWhYUtd4tF",
  render_errors: [view: NailindaWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Nailinda.PubSub, adapter: Phoenix.PubSub.PG2]

# Phauxth authentication configuration
config :phauxth,
  user_context: Nailinda.Accounts,
  crypto_module: Argon2,
  token_module: NailindaWeb.Auth.Token

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
