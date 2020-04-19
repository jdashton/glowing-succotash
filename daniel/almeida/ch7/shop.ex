defmodule Shop do
  def checkout(price) do
    try do
      {quantity, _} = ask_number("Quantity? ")
      {price, _} = ask_number("Price? ")
      quantity * price
    rescue
      MatchError -> "It's not a number"
    end
  end

  def ask_number(message) do
    (message <> "\n")
    |> IO.gets()
    |> Integer.parse()
  end
end
