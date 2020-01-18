# frozen_string_literal: true

require_relative 'lib/advent08'

input = IO.read('input/advent08.txt')

puts Advent08.new.fewest_zeros input

pictogram = Advent08.new.process(input)

SPACE = ' '
BLOCK = "\u2588"

pictogram.chars.each_slice(Advent08::WIDTH) do |line|
  line.each { |c| print c == ?1 ? BLOCK : SPACE }
  puts
end
