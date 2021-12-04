defmodule CurrencyConversionWeb.ConvertController do
  use CurrencyConversionWeb, :controller

  alias CurrencyConversion.{Currency, ExchangeRate, Params}

  action_fallback CurrencyConversionWeb.FallbackController

  def show(conn, wire_params) do
    params = Params.parse(wire_params)

    with {:ok, ^params} <- Currency.validate(params) do
      case ExchangeRate.convert(params) do
        {:ok, result} ->
          conn
          |> put_status(:ok)
          |> json(result)

        {:error, _} ->
          conn
          |> put_status(:internal_server_error)
          |> json(%{error: "Something unexpected happen. Try again"})
      end
    end
  end
end
