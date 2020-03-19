defmodule NumberCompare do
  def greater(number, other_number) when number >= other_number, do: number
  def greater(_, other_number), do: other_number
end

defmodule NumberCompareWithIf do
  def greater(number, other_number) do
    if number >= other_number do
      number
    else
      other_number
    end
  end
end
