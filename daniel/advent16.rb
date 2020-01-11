# frozen_string_literal: true

require_relative 'lib/advent16'

input = IO.read('input/advent16.txt')

def swiz(str)
  str.chars.map(&:to_i)
end

# adv16 = Advent16.new
p Advent16.new(swiz(input)).run[0..7].join
