# frozen_string_literal: true

require 'spec_helper'
require 'advent15'

NORTH = 1
SOUTH = 2
WEST = 3
EAST = 4

MOVES = Advent15::MOVES

WALL = 0
MOVE = 1
OXYGEN = 2

EX1_STEPS = [NORTH, WALL].freeze
EX1_WORLD = { Vector[0, 0] => MOVE,
              Vector[0, 1] => WALL }.freeze
EX2_STEPS = EX1_STEPS + [EAST, MOVE]
EX2_WORLD = EX1_WORLD.merge(Vector[1, 0] => MOVE)
EX3_STEPS = EX2_STEPS + [NORTH, WALL,
                         SOUTH, WALL,
                         EAST, WALL]
EX3_WORLD = EX2_WORLD.merge(Vector[1, 1]  => WALL,
                            Vector[1, -1] => WALL,
                            Vector[2, 0]  => WALL)
EX4_STEPS = EX3_STEPS + [WEST, MOVE,
                         WEST, WALL,
                         SOUTH, MOVE,
                         SOUTH, WALL,
                         WEST, OXYGEN]
EX4_WORLD = EX3_WORLD.merge(Vector[-1, 0]  => 0,
                            Vector[0, -1]  => 1,
                            Vector[0, -2]  => 0,
                            Vector[-1, -1] => 2)

SIMULATIONS = {
  EX1_STEPS => EX1_WORLD,
  EX2_STEPS => EX2_WORLD,
  EX3_STEPS => EX3_WORLD,
  EX4_STEPS => EX4_WORLD
}.freeze

describe Advent15 do
  subject(:adv15) { described_class.new }

  it 'detects the world as specified' do
    SIMULATIONS.each do |steps, world|
      adv15 = described_class.new
      adv15.simulate steps
      expect(adv15.known_world).to eq(world)
    end
  end

  it 'discovers the oxygen system at [-1, -1]' do
    adv15.puts(
      req = EX4_WORLD[adv15.coords + MOVES[adv15.gets]]
    ) until req == 2
    expect(adv15.oxygen_coords).to eq(Vector[-1, -1])
  end

  it 'discovers the oxygen system in 2 moves' do
    adv15.puts(
      req = EX4_WORLD[adv15.coords + MOVES[adv15.gets]]
    ) until req == 2
    expect(adv15.oxygen_num_moves).to eq(2)
  end
end
