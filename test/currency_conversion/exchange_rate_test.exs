defmodule CurrencyConversion.ExchangeRateTest do
  @moduledoc false

  use ExUnit.Case, async: true

  alias CurrencyConversion.ExchangeRate
  alias CurrencyConversion.Support.Fixtures

  setup do
    bypass = Bypass.open()

    Application.put_env(:currency_conversion, CurrencyConversion, exchange_rate_endpoint: "http://localhost:#{bypass.port}/convert")

    params = %{
      from: "USD",
      to: "BRL",
      amount: 10,
      result: 56.01
    }

    {:ok, bypass: bypass, params: params}
  end

  describe "convert/3" do
    test "with an success request, it returns a tuple with the formated data", %{bypass: bypass, params: params} do
      request_response = Fixtures.ExchangeRate.success_converted(params)

      Bypass.expect(bypass, fn conn ->
        Plug.Conn.send_resp(conn, 200, request_response)
      end)

      expected_response = {:ok,
      %{
        base_currency: "USD",
        target_currency: "BRL",
        base_amount: 10,
        converted_amount: 56.01,
        message: "10 USD -> 56.01 BRL"
      }}

      assert expected_response == ExchangeRate.convert(%{base_currency: "USD", target_currency: "BRL", amount: 10})
    end

    test "when something wrong, it returns a tuple with the error", %{bypass: bypass} do
      request_response = ""

      Bypass.expect(bypass, fn conn ->
        Plug.Conn.send_resp(conn, 500, request_response)
      end)

      assert {:error, "The service is not responding"} == ExchangeRate.convert(%{base_currency: "USD", target_currency: "BRL", amount: 10})
    end
  end
end
