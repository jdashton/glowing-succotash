# frozen_string_literal: true

require_relative 'lib/advent10'

input = IO.read('input/advent10.txt')

p Advent10.new.parse_map input

p Advent10.new.shoot_roids(input)[199]
