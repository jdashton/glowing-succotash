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

puts 'This program displays numbers as old-school Roman numerals.'
print 'Enter a number: '
num = gets.to_i

# Add `to_roman` to Integer class.
class Integer
  # Displays zero or more Roman numerals that fit into a number.
  # Returns the resulting Roman numeral string.
  def to_roman
    result = ''
    num = self

    FINAL_VALUES.each do |(value, numeral)|
      while num >= value
        num -= value
        result += numeral
      end
    end

    result
  end
end

puts "#{ num } in 'New' Roman numerals is #{ num.to_roman }."
