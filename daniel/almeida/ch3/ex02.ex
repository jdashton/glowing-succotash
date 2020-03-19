defmodule TicTacToe do
  def winner({a, _, _, _, a, _, _, _, a}), do: {:winner, a}
  def winner({a, a, a, _, _, _, _, _, _}), do: {:winner, a}
  def winner(_), do: :no_winner
end
