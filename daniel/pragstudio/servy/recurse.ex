defmodule Recurse do
  def sum(list, total \\ 0)
  def sum([head | tail ], total) do
    sum tail, total + head
  end
  def sum([], total), do: total

  def triple(list, acc \\ [])
  def triple([head | tail], acc) do
    triple(tail, [head * 3 | acc])
  end
  def triple([], acc), do: acc |> Enum.reverse
end

IO.puts "Sum: #{ Recurse.sum [1, 2, 3, 4, 5] }"
IO.inspect Recurse.triple([1, 2, 3, 4, 5])
