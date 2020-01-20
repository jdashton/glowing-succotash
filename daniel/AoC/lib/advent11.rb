# frozen_string_literal: true

require 'English'
require 'set'
require_relative './advent09'

# A hull-painting robot
class Advent11
  attr_reader :visited_panels

  def initialize(start_white = false)
    @x = @y = 0
    @visited_panels = Hash.new(0)
    @visited_panels[[0, 0]] = 1 if start_white
    @orientation = 0 # 0 is up, 1 is east, 2 is south, 3 is west
    @next_input = :color
  end

  def move
    if @orientation.odd?
      @x += @orientation == 1 ? +1 : -1
    else
      @y += @orientation.zero? ? -1 : +1
    end
  end

  def gets
    @visited_panels[[@x, @y]]
  end

  def puts(val)
    if @next_input == :color
      @next_input = :heading
      @visited_panels[[@x, @y]] = val
    else
      @next_input = :color
      @orientation += val == 1 ? +1 : -1
      @orientation %= 4
      move
    end
  end
end
