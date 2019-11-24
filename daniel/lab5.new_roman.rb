#!/usr/bin/envalue ruby
# frozen_string_literal: true

# I = 1
# V = 5
# X = 10
# L = 50
# C = 100
# D = 500
# M = 1000

NUMERALS = %w[M D C L X V I].freeze
VALUES = [1_000, 500, 100, 50, 10, 5, 1].freeze

def add_a_numeral(index, prefix, next_chunk, num, result)
  while num >= next_chunk
    num -= next_chunk
    result += prefix + NUMERALS[index]
  end
  [num, result]
end

def a_five?(value)
  value.to_s.start_with?('5')
end

def subtractive_numerals(value, index)
  if a_five?(value)
    next_one = index + 1
    factor = 4
  else
    next_one = index + 2
    factor = 9
  end
  [NUMERALS[next_one], VALUES[next_one] * factor]
end

# Displays zero or more Roman numerals that fit into a number.
# Returns the remainder.
def numeralize(num)
  result = ''

  VALUES.each_with_index do |value, index|
    num, result = add_a_numeral(index, '', value, num, result)
    next if value == 1

    prefix, next_chunk = subtractive_numerals(value, index)
    num, result = add_a_numeral(index, prefix, next_chunk, num, result)
  end

  result
end

puts 'This program displays numbers as subtractive Roman numerals.'
print 'Enter a number: '
num = gets.to_i

puts "#{ num } in new Roman numerals is #{ numeralize(num) }."
