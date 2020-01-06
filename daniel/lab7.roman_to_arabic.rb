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
ZIPPED_VALUES = VALUES.zip(NUMERALS).freeze
INTERMEDIATE_VALUES =
  ZIPPED_VALUES
    .select { |(i, _l)| i > 1 }
    .map
    .with_index do |(val, num), idx|
    next_one = idx + (val.to_s.start_with?(?5) ? 1 : 2)
    [val - VALUES[next_one], NUMERALS[next_one] + num]
  end
    .freeze
FINAL_VALUES =
  ZIPPED_VALUES
    .zip(INTERMEDIATE_VALUES)
    .flatten(1)
    .reject(&:nil?)
    .freeze

# Displays zero or more Roman numerals that fit into a number.
# Returns the resulting Roman numeral string.
def arabicize(roman)
  result = idx = 0

  FINAL_VALUES.each do |(value, numeral)|
    while roman[idx..].start_with?(numeral)
      idx += numeral.length
      result += value
    end
  end
  raise "Could not interpret \"#{ roman[idx..] }\"" if idx < roman.length

  result
end

puts 'This program displays numbers as old-school Roman numerals.'
print 'Enter a number: '
num = gets.chomp
p num

puts "#{ num } in Roman numerals means #{ arabicize(num) } in Arabic numerals."
