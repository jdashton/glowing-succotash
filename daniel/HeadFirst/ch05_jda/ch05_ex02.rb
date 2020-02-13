# frozen_string_literal: true

def with_these_numbers(first, second)
  yield(first, second)
end

with_these_numbers(1, 4) do |first, second|
  puts first + second
end

with_these_numbers(3, 6) do |first, second|
  puts first * second
end

with_these_numbers(12, 3) do |first, second|
  puts first / second
end
