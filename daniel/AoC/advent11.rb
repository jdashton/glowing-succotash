# frozen_string_literal: true

require_relative 'lib/advent09'
require_relative 'lib/advent11'

input =
  IO
    .read('input/advent11.txt')
    .split(?,)
    .map(&:to_i)

adv11 = Advent11.new true
Advent09.new.run input, adv11, adv11
# p adv11.visited_panels

coords = adv11.visited_panels.keys
x_coords = coords.map { |c| c[0] }
y_coords = coords.map { |c| c[1] }
x_range = x_coords.minmax
y_range = y_coords.minmax
# p x_range
# p y_range
(y_range[0]..y_range[1]).each do |y|
  (x_range[0]..x_range[1]).each do |x|
    print adv11.visited_panels[[x, y]].zero? ? ' ' : "\u2588"
  end
  puts
end
