# frozen_string_literal: true

# Procs

def do_until_false(first_input, some_proc)
  output = first_input

  while output
    input = output
    output = some_proc.call(input)
  end

  input
end

build_array_of_squares = lambda do |array|
  last_number = array.last
  return false if last_number <= 0

  array.pop
  array.push(last_number * last_number)
  array.push last_number - 1
end

always_false = proc { |_just_ignore_me| false }

puts do_until_false([5], build_array_of_squares).inspect

yum = 'lemonade with a hint of orange blossom water'
puts do_until_false(yum, always_false)
