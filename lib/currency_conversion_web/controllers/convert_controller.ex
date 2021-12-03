defmodule CurrencyConversionWeb.ConvertController do
  use CurrencyConversionWeb, :controller

  alias CurrencyConversion.Currency
  alias CurrencyConversion.ExchangeRate

  def show(conn, %{"from" => from, "to" => to, "amount" => amount}) do
    if Currency.valid?(from) && Currency.valid?(to) do
      params = %{base_currency: from, target_currency: to, amount: amount}

      case ExchangeRate.convert(params) do
        {:ok, result} ->
          conn
          |> put_status(:ok)
          |> json(result)

        {:error, _} ->
          conn
          |> put_status(:internal_server_error)
          |> json(%{error: "Something went wrong with the request. Try again"})
      end
    else
      conn
      |> put_status(:not_acceptable)
      |> json(%{error: "One or both currencies are invalids"})
    end
  end
end
