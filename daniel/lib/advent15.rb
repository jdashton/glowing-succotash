# frozen_string_literal: true

# Maze traversal for Intcode-controlled repair droid
class Advent15
  attr_reader :known_world, :coords
  attr_accessor :last_move_direction, :movelist

  NORTH = 1
  SOUTH = 2
  WEST = 3
  EAST = 4
  DIR_SEQ = [NORTH, EAST, SOUTH, WEST].freeze
  REV_DIR = {
    NORTH => SOUTH,
    SOUTH => NORTH,
    WEST  => EAST,
    EAST  => WEST
  }.freeze

  def initialize
    @coords = [0, 0]
    @known_world = { @coords => '.' }
    @last_move_direction = nil
    @movelist = []
    @backtracking = false
  end

  def gets
    raise 'Oxygen system found' if @known_world[@coords] == 'O'

    # First, try going in a direction we don't know yet.
    # If all are known, mark the current coords as 'U' unfruitful,
    #   and backtrack by reversing the previous move in movelist.
    DIR_SEQ.each do |dir|
      STDOUT.puts "Shall we go #{ dir }?"
      if @known_world[transform(@coords, dir)].nil?
        STDOUT.puts "  --  yes  --  "
        return @last_move_direction = dir
      end
    end
    STDOUT.puts "No unknown directions, mark #{ @coords } as unfruitful"
    @known_world[@coords] = ?U
    p @movelist
    @backtracking = true
    @last_move_direction = REV_DIR[@movelist.pop]
  end

  def transform(coords, direction)
    case direction
    when NORTH
      [coords[0], coords[1] + 1]
    when SOUTH
      [coords[0], coords[1] - 1]
    when WEST
      [coords[0] - 1, coords[1]]
    when EAST
      [coords[0] + 1, coords[1]]
    end
  end

  def simulate(interactions)
    interactions.each_slice(2) do |(direction, status)|
      @last_move_direction = direction
      puts(status)
    end
  end

  HIT_WALL = 0
  MOVED = 1
  MOVED_AND_ARRIVED = 2

  def puts(status)
    c = transform(@coords, @last_move_direction)
    @known_world[c] = (status == HIT_WALL ? '#' : '.')
    return if status == HIT_WALL

    @known_world[c] = 'O' if status == MOVED_AND_ARRIVED

    STDOUT.puts "  Last move was #{ @last_move_direction }"
    if @backtracking
      @backtracking = false
    else
      @movelist << @last_move_direction
    end
    STDOUT.puts "    Movelist now #{ @movelist }"
    @coords = c
    STDOUT.puts "  Now at coords #{ @coords }"

    return unless status == MOVED_AND_ARRIVED

    STDOUT.puts "Oxygen system found at #{ c } in #{ @movelist.size } moves."
  end
end
