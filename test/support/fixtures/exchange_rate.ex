defmodule CurrencyConversion.Support.Fixtures.ExchangeRate do
  @moduledoc """
  Fixtures for HTTP responses from ExchangeRate
  """

  def success_converted(%{from: from, to: to, amount: amount, result: result}) do
    ~s<
    {
      "date": "2021-11-30",
      "historical": false,
      "info": {"rate": 5.6},
      "query": {"amount": #{amount}, "from": "#{from}", "to": "#{to}"},
      "result": #{result},
      "success": true
    }
    >
  end
end
