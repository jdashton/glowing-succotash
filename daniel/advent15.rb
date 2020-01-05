# frozen_string_literal: true

require_relative 'lib/advent09'
require_relative 'lib/advent15'

input =
  IO
    .read('input/advent15.txt')
    .split(?,)
    .map(&:to_i)

adv15 = Advent15.new
Advent09.new.run input, adv15, adv15
puts "Oxygen system found at #{ adv15.oxygen_coords } " \
     "in #{ adv15.oxygen_num_moves } moves."

puts "Oxygen filled the room in #{ adv15.minutes_to_oxygen } minutes."
