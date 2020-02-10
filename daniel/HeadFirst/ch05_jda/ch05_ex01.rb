# frozen_string_literal: true

fruit_string = 'boulder, apple, banana, peach, cow'

fs1 = fruit_string.split(', ')
fs1.pop
fs1.shift

puts fs1.join(', ')
