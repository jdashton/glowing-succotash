# frozen_string_literal: true

require_relative 'lib/advent09'
require_relative 'lib/advent13'

input =
  IO
    .read('input/advent13.txt')
    .split(?,)
    .map(&:to_i)

adv13 = Advent13.new true
Advent09.new.run input, adv13, adv13
