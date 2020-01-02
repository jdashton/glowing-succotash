# frozen_string_literal: true

require 'spec_helper'
require 'advent14'

describe Advent14 do
  subject(:adv14) { described_class.new }

  before do
    consts = {
      'EXAMPLE1' => <<~EXAMPLE1_END
        10 ORE => 10 A
        1 ORE => 1 B
        7 A, 1 B => 1 C
        7 A, 1 C => 1 D
        7 A, 1 D => 1 E
        7 A, 1 E => 1 FUEL
      EXAMPLE1_END
                      .to_str,
      'EXAMPLE2' => <<~EXAMPLE2_END
        9 ORE => 2 A
        8 ORE => 3 B
        7 ORE => 5 C
        3 A, 4 B => 1 AB
        5 B, 7 C => 1 BC
        4 C, 1 A => 1 CA
        2 AB, 3 BC, 4 CA => 1 FUEL
      EXAMPLE2_END
                      .to_str
    }
    consts.each { |k, v| stub_const(k, v) }
  end

  it 'needs 31 ore to produce 1 fuel in EXAMPLE1' do
    expect(adv14.find_needs(EXAMPLE1)).to eq(31)
  end

  it 'needs 165 ore to produce 1 fuel in EXAMPLE2' do
    expect(adv14.find_needs(EXAMPLE2)).to eq(165)
  end
end
