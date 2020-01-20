# frozen_string_literal: true

require_relative 'lib/advent09'
require_relative 'lib/advent13'

input =
  IO
    .read('input/advent13.txt')
    .split(?,)
    .map(&:to_i)

input[0] = 2 # stick in 2 quarters
adv13 = Advent13.new
Advent09.new.run input, adv13, adv13
puts "Score: #{ adv13.score } with #{ adv13.count_blocks } blocks remaining"
