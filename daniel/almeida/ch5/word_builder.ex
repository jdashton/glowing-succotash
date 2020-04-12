defmodule WordBuilder do
  def build(alphabet, positions) do
    positions
    |> Enum.map(&(String.at(alphabet, &1)))
    |> Enum.join
  end
end
