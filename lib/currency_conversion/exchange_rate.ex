defmodule CurrencyConversion.ExchangeRate do
  @moduledoc """
  This module has the all business logic to communicate with the ExchangeRate service, the entry point is the function convert/3 and how
  to call the API, how endpoint to call, which params everything keeps encapsulated here.
  """

  @headers []
  @numbers_after_comma 2
  @error_message "The service is not responding"
  @ok_status 200

  @doc """
  This function receives the user input (the currencies and amount), calls the endpoint to get the converted amount, builds and
  returns the result.
  """
  @spec convert(map()) :: map()
  def convert(%{base_currency: base, target_currency: target, amount: amount}) do
    case HTTPoison.get(endpoint(), @headers, params: params(base, target, amount)) do
      {:ok, %{status_code: @ok_status, body: body}} ->
        body
        |> Jason.decode!([{:keys, :atoms}])
        |> format_response

      _ ->
        {:error, @error_message}
    end
  end

  @spec params(base_currency :: String.t(), target_currency :: String.t(), amount :: pos_integer) :: [tuple()]
  defp params(base_currency, target_currency, amount) do
    [{:from, base_currency}, {:to, target_currency}, {:amount, amount}, {:places, @numbers_after_comma}]
  end

  @spec format_response(response :: map()) :: map()
  defp format_response(%{result: converted_amount, query: %{from: from, to: to, amount: amount}}) do
    {:ok,
     %{
       base_currency: from,
       target_currency: to,
       base_amount: amount,
       converted_amount: converted_amount,
       message: "#{amount} #{from} -> #{converted_amount} #{to}"
     }}
  end

  @spec endpoint() :: String.t()
  defp endpoint() do
    [exchange_rate_endpoint: url] = Application.get_env(:currency_conversion, CurrencyConversion)
    url
  end
end
