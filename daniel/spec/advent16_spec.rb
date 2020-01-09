# frozen_string_literal: true

require 'spec_helper'
require 'advent16'

pats = [
  [0, 1, 0, -1],
  [0, 0, 1, 1, 0, 0, -1, -1],
  [0, 0, 0, 1, 1, 1, 0, 0, 0, -1, -1, -1],
  [0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, -1, -1, -1, -1]
]

describe Advent16 do
  subject(:adv16) { described_class.new }

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
end
