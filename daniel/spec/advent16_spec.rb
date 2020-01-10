# frozen_string_literal: true

require 'spec_helper'
require 'advent16'

pats = [
  [0, 1, 0, -1],
  [0, 0, 1, 1, 0, 0, -1, -1],
  [0, 0, 0, 1, 1, 1, 0, 0, 0, -1, -1, -1],
  [0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, -1, -1, -1, -1]
]

INPUT_SIGNAL = [1, 2, 3, 4, 5, 6, 7, 8].freeze
IS_LENGTH = INPUT_SIGNAL.length

describe Advent16 do
  subject(:adv16) { described_class.new(INPUT_SIGNAL) }

  # if the input list were 9, 8, 7, 6, 5 and the pattern for a given element
  # were 1, 2, 3, the result would be 9*1 + 8*2 + 7*3 + 6*1 + 5*2
  it 'calculates a simple list and pattern' do
    list = [9, 8, 7, 6, 5]
    pattern = [1, 2, 3]
    expect(adv16.apply_pat(list, pattern)).to eq(
      9 * 1 + 8 * 2 + 7 * 3 + 6 * 1 + 5 * 2
    )
  end

  it 'can generate the first four patterns' do
    aggregate_failures do
      pats.each { |p| expect(adv16.gen).to eq(p) }
    end
  end

  it 'can calculate the last digit' do
    expect(adv16.calc(IS_LENGTH - 1)).to eq(8)
  end

  it 'can calculate the penultimate digit' do
    expect(adv16.calc(IS_LENGTH - 2)).to eq(5)
  end

  it 'can calculate the third-to-last digit' do
    expect(adv16.calc(IS_LENGTH - 3)).to eq(1)
  end

  it 'can calculate the fourth-to-last digit' do
    expect(adv16.calc(IS_LENGTH - 4)).to eq(6)
  end

  it 'can calculate the fifth-to-last digit' do
    expect(adv16.calc(IS_LENGTH - 5)).to eq(2)
  end
end
