# frozen_string_literal: true

require_relative './advent09'

# An arcade game like Pong
class Advent13
  attr_reader :board, :score

  def initialize
    @board = {}
    @pending_coords = []
    @score = 0
    @ball_x = 0
    @paddle_x = 0
  end

  def gets
    @ball_x <=> @paddle_x
  end

  def puts(val)
    return @pending_coords << val if @pending_coords.size < 2

    if @pending_coords[0].negative?
      @score = val
    else
      @board[@pending_coords] = val
      @paddle_x = @pending_coords[0] if val == 3
      @ball_x = @pending_coords[0] if val == 4
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
