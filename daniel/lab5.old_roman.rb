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

puts 'This program displays numbers as old-school Roman numerals.'
print 'Enter a number: '
num = gets.to_i

# Displays zero or more Roman numerals that fit into a number.
# Returns the remainder.
def numeralize(num, rom_val = VALUES, rom_num = NUMERALS)
  result = ''

  rom_val.each_with_index do |v, i|
    while num >= v
      num -= v
      result += rom_num[i]
    end
  end

  result
end

puts "#{ num } in Old Roman numerals is #{ numeralize(num) }."
