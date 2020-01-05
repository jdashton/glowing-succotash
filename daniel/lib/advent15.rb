# frozen_string_literal: true

require 'matrix'

# Maze traversal for Intcode-controlled repair droid
class Advent15
  attr_reader :known_world, :coords, :oxygen_coords, :oxygen_num_moves

  ORIGIN = Vector[0, 0]

  def initialize
    @coords = ORIGIN
    @known_world = { @coords => 1 }
    @move_dir = nil
    @movelist = []
    @backtracking = false
  end

  MOVES = {
    1 => Vector[0, 1],  # North
    2 => Vector[0, -1], # South
    3 => Vector[-1, 0], # West
    4 => Vector[1, 0]   # East
  }.freeze

  INV_MOVES = MOVES.invert

  def gets
    # First, try going in a direction we don't know yet.
    # If all are known, backtrack by reversing the previous move in @movelist.
    MOVES.keys.each do |dir|
      return @move_dir = dir if @known_world[@coords + MOVES[dir]].nil?
      # return p(@move_dir = dir) if @known_world[@coords + MOVES[dir]].nil?
    end
    @backtracking = true
    @move_dir =
      @movelist.empty? ? nil : INV_MOVES[ORIGIN - MOVES[@movelist.pop]]
    # p(@move_dir =
    #     @movelist.empty? ? nil : INV_MOVES[ORIGIN - MOVES[@movelist.pop]])
  end

  def simulate(interactions)
    interactions.each_slice(2) do |(direction, status)|
      @move_dir = direction
      puts(status)
    end
  end

  HIT_WALL = 0
  MOVED_AND_ARRIVED = 2

  def puts(status)
    # p status
    raise 'status should never be nil' if status.nil?

    new_coords = @coords + MOVES[@move_dir]
    @known_world[new_coords] = status
    return if status == HIT_WALL

    @coords = new_coords
    @movelist << @move_dir unless @backtracking
    @backtracking = false if @backtracking
    return unless status == MOVED_AND_ARRIVED

    @oxygen_coords = @coords
    @oxygen_num_moves = @movelist.size
  end

  def fill_o2(coords)
    return 0 if @known_world[coords] != 1 # 0 is WALL, 2 is OXYGEN

    @known_world[coords] = 2
    MOVES.keys.map { |dir| 1 + fill_o2(coords + MOVES[dir]) }.max
  end

  def minutes_to_oxygen
    @coords = @oxygen_coords
    MOVES.keys.map { |dir| fill_o2(coords + MOVES[dir]) }.max
  end
end
