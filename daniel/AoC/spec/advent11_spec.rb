# frozen_string_literal: true

require 'spec_helper'
require 'advent11'
require 'tracer'

describe Advent11 do
  subject(:adv11) { described_class.new }

  before do
    consts = {
      'INSTRUCTIONS' =>
                        [
                          1, 0,
                          0, 0,
                          1, 0,
                          1, 0,
                          0, 1,
                          1, 0,
                          1, 0
                        ]
    }
    consts.each { |k, v| stub_const(k, v) }
  end

  it 'outputs 0 as its first action' do
    expect(adv11.gets).to eq 0
  end

  it 'outputs 0 as its first and second action' do
    adv11.puts 1 # paint white
    adv11.puts 0 # turn left and move forward
    expect(adv11.gets).to eq 0
  end

  def read_and_write(robot, val_i, val_j)
    robot.puts val_i
    robot.puts val_j
    robot.gets
  end

  it 'visits and reports the color of 6 panels' do
    panel_colors = [adv11.gets]
    INSTRUCTIONS.each_slice(2) do |i, j|
      panel_colors << read_and_write(adv11, i, j)
    end
    expect(panel_colors).to eq([0, 0, 0, 0, 1, 0, 0, 0])
  end

  it 'visits and paints 6 panels' do
    adv11.gets
    INSTRUCTIONS.each_slice(2) do |i, j|
      read_and_write adv11, i, j
    end
    expect(adv11.visited_panels.size).to eq 6
  end
end
