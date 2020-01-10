# frozen_string_literal: true

require 'matrix'

# Maze traversal for Intcode-controlled repair droid
class Advent16
  PATTERN = [0, 1, 0, -1].freeze
  def initialize(input_signal)
    @input_signal = input_signal
    @pattern = [[], [], [], []]
  end

  def gen
    @pattern = @pattern.zip(PATTERN)
    @pattern.flatten
  end

  def apply_pat(list, pat)
    l = pat.length
    list.each.with_index.reduce(0) do |acc, (c, idx)|
      acc + c.to_i * pat[idx % l]
    end
  end

  def calc(index)
    return @input_signal[index] if index == @input_signal.length - 1

    (@input_signal[index] + calc(index + 1)) % 10
  end
end
