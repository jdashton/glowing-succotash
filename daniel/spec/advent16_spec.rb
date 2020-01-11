# frozen_string_literal: true

require 'spec_helper'
require 'advent16'

P = {
  0 => {
    add: [0, 4, 8, 12, 16],
    sub: [2, 6, 10, 14, 18]
  },
  1 => {
    add: [1, 2, 9, 10, 17, 18],
    sub: [5, 6, 13, 14]
  },
  2 => {
    add: [2, 3, 4, 14, 15, 16],
    sub: [8, 9, 10]
  },
  3 => {
    add: [3, 4, 5, 6],
    sub: [11, 12, 13, 14]
  },
  4 => {
    add: [4, 5, 6, 7, 8],
    sub: [14, 15, 16, 17, 18]
  },
  5 => {
    add: [5, 6, 7, 8, 9, 10],
    sub: [17, 18]
  }
}.freeze

INPUT_SIGNAL = [1, 2, 3, 4, 5, 6, 7, 8].freeze
IS_LENGTH = INPUT_SIGNAL.length

OUTPUTS = {
  1 => [4, 8, 2, 2, 6, 1, 5, 8],
  2 => [3, 4, 0, 4, 0, 4, 3, 8],
  3 => [0, 3, 4, 1, 5, 5, 1, 8],
  4 => [0, 1, 0, 2, 9, 4, 9, 8]
}.freeze

LONGER = {
  '80871224585914546619083218645595' => '24176176',
  '19617804207202209144916044189917' => '73745418',
  '69317163492948606335995924319873' => '52432133'
}.freeze

WITH_REPEATS = {
  '03036732577212944063491565474664' => '84462026',
  '02935109699940807407585447034323' => '78725270',
  '03081770884921959731165446850517' => '53553731'
}.freeze

describe Advent16 do
  subject(:adv16) { described_class.new(INPUT_SIGNAL) }

  it 'generates the pattern for each early row' do
    aggregate_failures do
      P.keys.each { |p| expect(adv16.gen(p, 19)).to eq(P[p]) }
    end
  end

  it 'calculates the last digit' do
    expect(adv16.calc(IS_LENGTH - 1)).to eq(8)
  end

  it 'calculates the penultimate digit' do
    expect(adv16.calc(IS_LENGTH - 2)).to eq(5)
  end

  it 'calculates the third-to-last digit' do
    expect(adv16.calc(IS_LENGTH - 3)).to eq(1)
  end

  it 'calculates the fourth-to-last digit' do
    expect(adv16.calc(IS_LENGTH - 4)).to eq(6)
  end

  it 'calculates the fifth-to-last digit' do
    expect(adv16.calc(IS_LENGTH - 5)).to eq(2)
  end

  it 'calculates the sixth-to-last digit' do
    expect(adv16.calc(IS_LENGTH - 6)).to eq(2)
  end

  it 'calculates the seventh-to-last digit' do
    expect(adv16.calc(IS_LENGTH - 7)).to eq(8)
  end

  it 'calculates the eighth-to-last digit' do
    expect(adv16.calc(IS_LENGTH - 8)).to eq(4)
  end

  it 'calculates only the last two chars if asked' do
    adv16.calc_full_phase(6)
    adv16.reset
    expect(adv16.i_s).to eq([nil, nil, nil, nil, nil, nil, 5, 8])
  end

  it 'calculates only the last two chars over 4 phases if asked' do
    expect(adv16.run(4, 6)).to eq([nil, nil, nil, nil, nil, nil, 9, 8])
  end

  it 'finds the expected output after each of four phases' do
    aggregate_failures do
      OUTPUTS.each do |_, v|
        expect(adv16.run(1)).to eq(v)
      end
    end
  end

  def swiz(str)
    str.chars.map(&:to_i)
  end

  it 'gets expected results for longer examples' do
    aggregate_failures do
      LONGER.each do |i_s, f_e|
        expect(described_class.new(swiz(i_s)).run[0..7]).to eq(swiz(f_e))
      end
    end
  end

  it 'gets expected results for 10k examples' do
    aggregate_failures do
      WITH_REPEATS.each do |i_s, f_e|
        expect(described_class.new(swiz(i_s) * 10_000).run10k).to eq(swiz(f_e))
      end
    end
  end
end
