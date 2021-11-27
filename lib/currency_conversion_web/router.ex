defmodule CurrencyConversionWeb.Router do
  use CurrencyConversionWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", CurrencyConversionWeb do
    pipe_through :api
  end
end
