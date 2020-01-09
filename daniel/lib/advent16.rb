# frozen_string_literal: true

require 'matrix'

# Maze traversal for Intcode-controlled repair droid
class Advent16
  PATTERN = [0, 1, 0, -1].freeze
  def initialize
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
end
