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

def one_under(index, prefix, next_chunk, num, result)
  while num >= next_chunk
    num -= next_chunk
    result += prefix + NUMERALS[index]
  end
  [num, result]
end

def a_five?(value)
  value.to_s.start_with?('5')
end

# Displays zero or more Roman numerals that fit into a number.
# Returns the remainder.
def numeralize(num)
  result = ''

  VALUES.each_with_index do |value, index|
    num, result = one_under(index, '', value, num, result)
    break if value == 1

    if a_five?(value)
      prefix = NUMERALS[index + 1]
      next_chunk = VALUES[index + 1] * 4
    else
      prefix = NUMERALS[index + 2]
      next_chunk = VALUES[index + 2] * 9
    end
    num, result = one_under(index, prefix, next_chunk, num, result)
  end

  result
end

puts 'This program displays numbers as subtractive Roman numerals.'
print 'Enter a number: '
num = gets.to_i

puts "#{ num } in new Roman numerals is #{ numeralize(num) }."
