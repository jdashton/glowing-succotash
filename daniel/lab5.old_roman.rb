#!/usr/bin/env ruby
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
ZIPPED_VALUES = VALUES.zip NUMERALS

puts 'This program displays numbers as old-school Roman numerals.'
print 'Enter a number: '
num = gets.to_i

# Displays zero or more Roman numerals that fit into a number.
# Returns the resulting Roman numeral string.
def numeralize(num)
  result = ''

  ZIPPED_VALUES.each do |(value, numeral)|
    while num >= value
      num -= value
      result += numeral
    end
  end

  result
end

puts "#{ num } in Old Roman numerals is #{ numeralize(num) }."
