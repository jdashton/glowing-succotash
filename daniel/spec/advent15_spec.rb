# frozen_string_literal: true

require 'spec_helper'
require 'advent15'
require 'tracer'

NORTH = Advent15::NORTH
SOUTH = Advent15::SOUTH
WEST = Advent15::WEST
EAST = Advent15::EAST

EX1_STEPS = [NORTH, 0].freeze
EX1_WORLD = { [0, 0] => '.', [0, 1] => '#' }.freeze
EX2_STEPS = EX1_STEPS + [EAST, 1]
EX2_WORLD = EX1_WORLD.merge([1, 0] => '.')
EX3_STEPS = EX2_STEPS + [NORTH, 0, SOUTH, 0, EAST, 0]
EX3_WORLD = EX2_WORLD.merge([1, 1] => '#', [1, -1] => '#', [2, 0] => '#')
EX4_STEPS = EX3_STEPS + [WEST, 1, WEST, 0, SOUTH, 1, SOUTH, 0, WEST, 2]
EX4_WORLD = EX3_WORLD.merge([-1, 0] => '#', [0, -1] => '.', [0, -2] => '#',
  [-1, -1] => 'O')

SIMULATIONS = {
  EX1_STEPS => EX1_WORLD,
  EX2_STEPS => EX2_WORLD,
  EX3_STEPS => EX3_WORLD,
  EX4_STEPS => EX4_WORLD
}.freeze

TRANSLATION = { ?# => 0, ?. => 1, ?O => 2 }.freeze

describe Advent15 do
  subject(:adv15) { described_class.new }

  it 'detects the world as specified' do
    SIMULATIONS.each do |steps, world|
      adv15 = described_class.new
      adv15.simulate steps
      expect(adv15.known_world).to eq(world)
    end
  end

  it 'discovers the oxygen system' do
    # Tracer.on
    loop do
      move = adv15.gets
      puts "Requested move #{ move }"
      expect(move).not_to be_nil
      req = EX4_WORLD[adv15.transform(adv15.coords, move)]
      adv15.puts(TRANSLATION[req])
    end
  rescue RuntimeError
    expect(adv15.coords).to eq([-1, -1])
    expect(adv15.movelist.size).to eq(2)
  end
end
