# frozen_string_literal: true

require_relative 'lib/advent11'

input =
  IO
    .read('input/advent11.txt')
    .split(?,)
    .map(&:to_i)

Advent11.new.run input
