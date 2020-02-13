# frozen_string_literal: true

def yield_number
  yield 4
end

array = [1, 2, 3]

yield_number { |number| array << number }

p array

sum = 0
[1, 2, 3].each { |number| sum += number }
puts sum

contents = []
File.open('ch06_sample.txt') do |file|
  contents = file.readlines
end

puts contents
