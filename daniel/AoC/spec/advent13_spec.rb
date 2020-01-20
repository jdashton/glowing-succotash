# frozen_string_literal: true

require 'spec_helper'
require 'advent13'
require 'tracer'

describe Advent13 do
  subject(:adv13) { described_class.new }

  before do
    consts = {
      'INSTRUCTIONS' =>
                        [
                          1, 2, 3,
                          6, 5, 4
                        ]
    }
    consts.each { |k, v| stub_const(k, v) }
  end

  it 'draws a paddle and ball' do
    adv13.run INSTRUCTIONS
    expect(adv13.board).to eq([1, 2] => 3, [6, 5] => 4)
  end

  it 'counts zero block tiles' do
    adv13.run INSTRUCTIONS
    expect(adv13.count_blocks).to be_zero
  end
end
