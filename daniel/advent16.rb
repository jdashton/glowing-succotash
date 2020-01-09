# frozen_string_literal: true

require_relative 'lib/advent16'

input =
  IO
    .read('input/advent16.txt')
    .split(?,)
    .map(&:to_i)

adv16 = Advent16.new
