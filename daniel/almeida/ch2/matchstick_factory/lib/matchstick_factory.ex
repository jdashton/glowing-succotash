defmodule MatchstickFactory do
  @moduledoc """
  Documentation for MatchstickFactory.
  """

  @box_sizes %{ big: 50, medium: 20, small: 5 }

  @doc """
  boxes

  ## Examples

      iex> MatchstickFactory.boxes(98)
      %{big: 1, medium: 2, remaining_matchsticks: 3, small: 1}
      iex> MatchstickFactory.boxes(39)
      %{big: 0, medium: 1, remaining_matchsticks: 4, small: 3}

  """
  def boxes(sticks) do
    bigs = div sticks, @box_sizes[:big]
    meds = rem(sticks, @box_sizes[:big])
           |> div(@box_sizes[:medium])
    smalls = rem(sticks, @box_sizes[:medium])
           |> div(@box_sizes[:small])
    %{ big: bigs, medium: meds, remaining_matchsticks: 4, small: smalls }
  end
end
