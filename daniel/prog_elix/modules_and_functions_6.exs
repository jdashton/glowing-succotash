defmodule Chop do
  def guess(actual, low..high) when low == high do
    my_guess = low
    IO.puts("It's between #{low} and #{high}.  It must be #{my_guess}.")
    check_guess(actual, my_guess, low..high)
  end

  def guess(actual, low..high) do
    my_guess = low + div(high - low, 2)
    IO.puts("It's between #{low} and #{high}.  Is it #{my_guess}?")
    check_guess(actual, my_guess, low..high)
  end

  defp check_guess(a, g, _..high) when g < a do
    IO.puts("...too low")
    guess(a, (g + 1)..high)
  end

  defp check_guess(a, g, low.._) when g > a do
    IO.puts("...too high")
    guess(a, low..(g - 1))
  end

  defp check_guess(a, _, _), do: a |> IO.puts()
end
