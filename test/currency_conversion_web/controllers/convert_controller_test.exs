defmodule CurrencyConversionWeb.ConvertControllerTest do
  use CurrencyConversionWeb.ConnCase

  alias CurrencyConversion.Support.Fixtures

  setup do
    bypass = Bypass.open()

    Application.put_env(:currency_conversion, :exchange_rate,
      endpoint: "http://localhost:#{bypass.port}/"
    )

    params = %{
      from: "USD",
      to: "BRL",
      amount: 10,
      result: 56.01
    }

    {:ok, bypass: bypass, params: params}
  end

  describe "GET /api/convert" do
    test "with invalid base_currency, it returns an error message", %{conn: conn} do
      response =
        conn
        |> get(Routes.convert_path(conn, :show), %{from: "ALN", to: "BRL", amount: 10})
        |> json_response(:bad_request)

      assert %{"errors" => %{"detail" => "The from currency is not valid"}} = response
    end

    test "with invalid target_currency, it returns an error message", %{conn: conn} do
      response =
        conn
        |> get(Routes.convert_path(conn, :show), %{from: "USD", to: "ALN", amount: 10})
        |> json_response(:bad_request)

      assert %{"errors" => %{"detail" => "The to currency is not valid"}} = response
    end

    test "with valid params received, it returns the message with the amount converted", %{
      conn: conn,
      bypass: bypass,
      params: params
    } do
      request_response = Fixtures.ExchangeRate.success_converted(params)

      Bypass.expect(bypass, fn conn ->
        Plug.Conn.send_resp(conn, 200, request_response)
      end)

      response =
        conn
        |> get(Routes.convert_path(conn, :show), %{from: "USD", to: "BRL", amount: 10})
        |> json_response(:ok)

      expected_response = %{
        "base_currency" => "USD",
        "base_amount" => 10,
        "target_currency" => "BRL",
        "converted_amount" => 56.01,
        "message" => "10 USD -> 56.01 BRL"
      }

      assert expected_response == response
    end
  end
end
