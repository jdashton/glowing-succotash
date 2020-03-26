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

  def my_map(list, fun, acc \\ [])
  def my_map([head | tail], fun, acc) do
    my_map(tail, fun, [fun.(head) | acc])
  end
  def my_map([], _fun, acc), do: Enum.reverse acc
end

IO.puts "Sum: #{ Recurse.sum [1, 2, 3, 4, 5] }"
IO.inspect Recurse.triple([1, 2, 3, 4, 5])

nums = [1, 2, 3, 4, 5]
IO.inspect Recurse.my_map(nums, &(&1 * 2))
IO.inspect Recurse.my_map(nums, &(&1 * 4))
IO.inspect Recurse.my_map(nums, &(&1 * 5))
