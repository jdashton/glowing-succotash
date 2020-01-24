# frozen_string_literal: true

require_relative 'lib/advent01'

INPUT = IO.read('input/advent01.txt')

adv1 = Advent01.new
puts adv1.total_fuel(INPUT.lines.map(&:to_i))
