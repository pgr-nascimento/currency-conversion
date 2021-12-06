defmodule CurrencyConversionWeb.ConvertController do
  use CurrencyConversionWeb, :controller

  alias CurrencyConversion.{Currency, ExchangeRate, Params}

  def show(conn, wire_params) do
    params = Params.parse(wire_params)

    with :ok <- Currency.validate(params),
         {:ok, result} <- ExchangeRate.convert(params) do
      conn
      |> put_status(:ok)
      |> json(result)
    else
      {:error, {:invalid_currency, message}} ->
        conn
        |> put_status(:bad_request)
        |> put_view(CurrencyConversionWeb.ErrorView)
        |> render("400.json", error: message)

      {:error, _} ->
        conn
        |> put_status(:internal_server_error)
        |> json(%{error: "Something unexpected happen. Try again"})
    end
  end
end
