defmodule IncomeTax do
  def tax(income) do
    cond do
      income <= 2_000 -> 0
      income <= 3_000 -> income * 0.05
      income <= 6_000 -> income * 0.10
      true -> income * 0.15
    end
  end
end

case Float.parse(IO.gets "Salary: ") do
  {salary, _} ->
    tax = IncomeTax.tax(salary)
    IO.puts "Income Tax: #{ tax }"
    IO.puts "Net Wage: #{ salary - tax }"
  _ -> IO.puts "Salary must parse as a number."
end
