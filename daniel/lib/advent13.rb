# frozen_string_literal: true

require_relative './advent09'

# An arcade game like Pong
class Advent13
  attr_reader :board, :score

  def initialize
    @board = {}
    @pending_coords = []
    @score = 0
  end

  def gets
    0
  end

  def puts(val)
    if @pending_coords.size < 2
      @pending_coords << val
      return
    end
    if @pending_coords[0].negative?
      @score = val
    else
      @board[@pending_coords] = val
    end
    @pending_coords = []
  end

  def run(insts)
    insts.each { |i| self.puts i }
  end

  def count_blocks
    @board.values.tally[2] || 0
  end
end
