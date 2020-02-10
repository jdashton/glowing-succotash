# frozen_string_literal: true

def bar_chart(array)
  array.each do |value|
    puts '$' * yield(value)
  end
end

array = [1, 2, 3, 4, 5]

puts 'Multiplication:'
# The next line of code should print:
# $$$
# $$$$$$
# $$$$$$$$$
# $$$$$$$$$$$$
# $$$$$$$$$$$$$$$
bar_chart(array) { |number| 3 * number }

puts 'Division:'
# The next line of code should print:
# $$$$$$$$$$$$$$$$$$$$
# $$$$$$$$$$
# $$$$$$
# $$$$$
# $$$$
bar_chart(array) { |number| 20.0 / number }
