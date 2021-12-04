defmodule CurrencyConversion.Params do
  @moduledoc false

  @type from :: String.t()
  @type to :: String.t()
  @type amount :: String.t()

  @type user_params :: %{from => String.t(), to => String.t(), amount => String.t()}
  @type parsed_params :: %{
          base_currency: String.t(),
          target_currency: String.t(),
          amount: String.t()
        }

  @doc """
    Parses the user params to an internal map. The function isn't concerned about if the params is valid or not, the function
    transforms a map with strings key to atom keys and upcase the currencies.
  """

  @spec parse(user_params()) :: parsed_params()
  def parse(params) do
    base_currency = String.upcase(Map.get(params, "from", ""))
    target_currency = String.upcase(Map.get(params, "to", ""))

    %{
      base_currency: base_currency,
      target_currency: target_currency,
      amount: Map.get(params, "amount")
    }
  end
end
