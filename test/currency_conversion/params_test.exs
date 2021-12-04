defmodule CurrencyConversion.ParamsTest do
  @moduledoc false

  use ExUnit.Case
  alias CurrencyConversion.Params

  describe "parse/1" do
    test "change the string key map to a map with atom keys" do
      wire_params = %{"from" => "USD", "to" => "BRL", "amount" => "19.0"}

      expected_result = %{base_currency: "USD", target_currency: "BRL", amount: "19.0"}

      assert expected_result == Params.parse(wire_params)
    end

    test "change the currencies to upcase" do
      wire_params = %{"from" => "usd", "to" => "brl", "amount" => "19.0"}

      expected_result = %{base_currency: "USD", target_currency: "BRL", amount: "19.0"}

      assert expected_result == Params.parse(wire_params)
    end
  end
end
