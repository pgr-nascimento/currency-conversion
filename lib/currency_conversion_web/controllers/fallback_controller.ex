defmodule CurrencyConversionWeb.FallbackController do
  use CurrencyConversionWeb, :controller

  def call(conn, {:error, message}) do
    conn
    |> put_status(:bad_request)
    |> put_view(CurrencyConversionWeb.ErrorView)
    |> render("400.json", error: message)
  end
end
