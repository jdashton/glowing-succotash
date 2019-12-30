# frozen_string_literal: true

require 'English'
require 'set'
require_relative './advent09'

# A hull-painting robot
class Advent11
  def initialize(inpipe, outpipe)
    @inpipe = inpipe
    @outpipe = outpipe
    @x = @y = 0
    @visited_panels = Hash.new(0)
    @orientation = 0 # 0 is up, 1 is east, 2 is south, 3 is west
  end

  def run
    @outpipe[1].puts @visited_panels[[@x, @y]]
    color = @inpipe[0].gets.to_i
    @visited_panels[[@x, @y]] = color
    turn = @inpipe[0].gets.to_i
    @orientation += turn == 1 ? +1 : -1
    @orientation %= 4
  end
end
