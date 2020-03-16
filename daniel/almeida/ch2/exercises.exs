
IO.puts (10 * 0.10) + (3 * 2) + 15

distance = 200
time = 4
avg_velocity = distance / time
IO.puts "Bob traveled #{ distance } km in #{ time } hours, " <>
        "with an average velocity of #{ avg_velocity} km/hour."

tax_rate = 0.12
apply_tax = fn price ->
  IO.puts "Price: #{ price * (1 + tax_rate) |> Float.round(4) } - Tax: #{ price * tax_rate }"
end

Enum.each [12.5, 30.99, 250.49, 18.80], apply_tax
