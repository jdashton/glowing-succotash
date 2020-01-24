# frozen_string_literal: true

require_relative 'lib/advent02'

input =
  IO
    .read('input/advent02.txt')
    .split(?,)
    .map(&:to_i)

adv2 = Advent02.new
input[1] = 12
input[2] = 2
output = adv2.run(input.dup)
puts output[0]

# Look for the input that produces 19690720 in [0]
(0..99).each do |noun|
  (0..99).each do |verb|
    new_code = [].replace(input)
    new_code[1] = noun
    new_code[2] = verb
    output = adv2.run(new_code)
    puts noun * 100 + verb if output[0] == 19_690_720
  end
end
