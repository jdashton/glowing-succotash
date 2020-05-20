defmodule Fib do
  def of(0), do: 0
  def of(i) when i <= 2, do: 1
  def of(i), do: of(i - 1) + of(i - 2)
end
