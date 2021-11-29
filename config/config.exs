# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :currency_conversion, CurrencyConversionWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "vUk3nCHcFmySGRSMRNZFlBTraJuD2R7mctI83P+TZtk48QciFNsnCo4FRIk5yMXU",
  render_errors: [view: CurrencyConversionWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: CurrencyConversion.PubSub,
  live_view: [signing_salt: "4eg7Tp5b"],
  api_key: "4073344916d44278d7b1b860d2ff346b"


# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
