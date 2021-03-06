# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :rockelivery,
  ecto_repos: [Rockelivery.Repo]

config :rockelivery, Rockelivery.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

# Configures the endpoint
config :rockelivery, RockeliveryWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ITYP62efds0H68yqavfWCGYC8il7dsqyo2JFxXbSzJxd+tw2PMVw/6eFeApb1nl8",
  render_errors: [view: RockeliveryWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Rockelivery.PubSub,
  live_view: [signing_salt: "fVrShhfR"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :rockelivery, Rockelivery.Users.Create, via_cep_adapter: Rockelivery.ViaCep.Client

# Guardian
config :rockelivery, RockeliveryWeb.Auth.Guardian,
  issuer: "rockelivery",
  secret_key: "+0D/e8dBgxsKhp9exop4dOEn1Llza8E5L1ah6in2nZXbQyKqeA9y4BEpZanYfnRQ"

config :rockelivery, RockeliveryWeb.Auth.Pipeline,
  module: RockeliveryWeb.Auth.Guardian,
  error_handler: RockeliveryWeb.Auth.ErrorHandler

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
