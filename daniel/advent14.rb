# frozen_string_literal: true

require_relative 'lib/advent14'

input =
  IO
    .read('input/advent14.txt')

adv14 = Advent14.new input
p adv14
