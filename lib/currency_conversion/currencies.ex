defmodule CurrencyConversion.Currency do
  @moduledoc """
  Handle with currencies knowed of the system
  """
  @valid_curriencies ["USD", "BRL", "EUR"]

  @doc """
  Check if the currency received is valid (the string exists in @valid_curriencies?)
  """

  @spec valid?(String.t()) :: boolean()
  def valid?(currency) do
    String.upcase(currency) in @valid_curriencies
  end
end
