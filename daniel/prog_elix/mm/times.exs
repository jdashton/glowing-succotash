defmodule Times do
  def double(n), do: n * 2

  def triple(n), do: n * 3

  def quadruple(n), do: double(double(n))

  def greet(greeting, name), do: (
    IO.puts greeting
    IO.puts "How're you doing, #{name}?"
  )
end
