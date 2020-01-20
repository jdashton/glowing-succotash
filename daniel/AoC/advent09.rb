# frozen_string_literal: true

require_relative 'lib/advent09'

input =
  IO
    .read('input/advent09.txt')
    .split(?,)
    .map(&:to_i)

Advent09.new.run input
