# frozen_string_literal: true

require_relative 'lib/advent09'
require_relative 'lib/advent15'

# input =
IO
  .read('input/advent15.txt')
  .split(?,)
  .map(&:to_i)

# adv17 = Advent17.new
# Advent09.new.run input, adv17, adv17
