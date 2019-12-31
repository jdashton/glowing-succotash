# frozen_string_literal: true

require 'spec_helper'
require 'advent12'
# require 'tracer'

describe Advent12 do
  subject(:adv12) { described_class.new }

  before do
    consts = {
      'INIT_POS' => <<~INIT_POS_END
        <x=-8, y=-10, z=0>
        <x=5, y=5, z=10>
        <x=2, y=-7, z=3>
        <x=9, y=-8, z=-3>
      INIT_POS_END
                      .to_str,
      'STEP0'    => <<~STEP0_END
        pos=<x= -8, y=-10, z=  0>, vel=<x=  0, y=  0, z=  0>
        pos=<x=  5, y=  5, z= 10>, vel=<x=  0, y=  0, z=  0>
        pos=<x=  2, y= -7, z=  3>, vel=<x=  0, y=  0, z=  0>
        pos=<x=  9, y= -8, z= -3>, vel=<x=  0, y=  0, z=  0>
      STEP0_END
                      .to_str,
      'STEP10'   => <<~STEP10_END
        pos=<x= -9, y=-10, z=  1>, vel=<x= -2, y= -2, z= -1>
        pos=<x=  4, y= 10, z=  9>, vel=<x= -3, y=  7, z= -2>
        pos=<x=  8, y=-10, z= -3>, vel=<x=  5, y= -1, z= -2>
        pos=<x=  5, y=-10, z=  3>, vel=<x=  0, y= -4, z=  5>
      STEP10_END
                      .to_str,
      'STEP20'   => <<~STEP20_END
        pos=<x=-10, y=  3, z= -4>, vel=<x= -5, y=  2, z=  0>
        pos=<x=  5, y=-25, z=  6>, vel=<x=  1, y=  1, z= -4>
        pos=<x= 13, y=  1, z=  1>, vel=<x=  5, y= -2, z=  2>
        pos=<x=  0, y=  1, z=  7>, vel=<x= -1, y= -1, z=  2>
      STEP20_END
                      .to_str,
      'STEP30'   => <<~STEP30_END
        pos=<x= 15, y= -6, z= -9>, vel=<x= -5, y=  4, z=  0>
        pos=<x= -4, y=-11, z=  3>, vel=<x= -3, y=-10, z=  0>
        pos=<x=  0, y= -1, z= 11>, vel=<x=  7, y=  4, z=  3>
        pos=<x= -3, y= -2, z=  5>, vel=<x=  1, y=  2, z= -3>
      STEP30_END
                      .to_str,
      'STEP40'   => <<~STEP40_END
        pos=<x= 14, y=-12, z= -4>, vel=<x= 11, y=  3, z=  0>
        pos=<x= -1, y= 18, z=  8>, vel=<x= -5, y=  2, z=  3>
        pos=<x= -5, y=-14, z=  8>, vel=<x=  1, y= -2, z=  0>
        pos=<x=  0, y=-12, z= -2>, vel=<x= -7, y= -3, z= -3>
      STEP40_END
                      .to_str,
      'STEP50'   => <<~STEP50_END
        pos=<x=-23, y=  4, z=  1>, vel=<x= -7, y= -1, z=  2>
        pos=<x= 20, y=-31, z= 13>, vel=<x=  5, y=  3, z=  4>
        pos=<x= -4, y=  6, z=  1>, vel=<x= -1, y=  1, z= -3>
        pos=<x= 15, y=  1, z= -5>, vel=<x=  3, y= -3, z= -3>
      STEP50_END
                      .to_str,
      'STEP60'   => <<~STEP60_END
        pos=<x= 36, y=-10, z=  6>, vel=<x=  5, y=  0, z=  3>
        pos=<x=-18, y= 10, z=  9>, vel=<x= -3, y= -7, z=  5>
        pos=<x=  8, y=-12, z= -3>, vel=<x= -2, y=  1, z= -7>
        pos=<x=-18, y= -8, z= -2>, vel=<x=  0, y=  6, z= -1>
      STEP60_END
                      .to_str,
      'STEP70'   => <<~STEP70_END
        pos=<x=-33, y= -6, z=  5>, vel=<x= -5, y= -4, z=  7>
        pos=<x= 13, y= -9, z=  2>, vel=<x= -2, y= 11, z=  3>
        pos=<x= 11, y= -8, z=  2>, vel=<x=  8, y= -6, z= -7>
        pos=<x= 17, y=  3, z=  1>, vel=<x= -1, y= -1, z= -3>
      STEP70_END
                      .to_str,
      'STEP80'   => <<~STEP80_END
        pos=<x= 30, y= -8, z=  3>, vel=<x=  3, y=  3, z=  0>
        pos=<x= -2, y= -4, z=  0>, vel=<x=  4, y=-13, z=  2>
        pos=<x=-18, y= -7, z= 15>, vel=<x= -8, y=  2, z= -2>
        pos=<x= -2, y= -1, z= -8>, vel=<x=  1, y=  8, z=  0>
      STEP80_END
                      .to_str,
      'STEP90'   => <<~STEP90_END
        pos=<x=-25, y= -1, z=  4>, vel=<x=  1, y= -3, z=  4>
        pos=<x=  2, y= -9, z=  0>, vel=<x= -3, y= 13, z= -1>
        pos=<x= 32, y= -8, z= 14>, vel=<x=  5, y= -4, z=  6>
        pos=<x= -1, y= -2, z= -8>, vel=<x= -3, y= -6, z= -9>
      STEP90_END
                      .to_str,
      'STEP100'  => <<~STEP100_END
        pos=<x=  8, y=-12, z= -9>, vel=<x= -7, y=  3, z=  0>
        pos=<x= 13, y= 16, z= -3>, vel=<x=  3, y=-11, z= -5>
        pos=<x=-29, y=-11, z= -1>, vel=<x= -3, y=  7, z=  4>
        pos=<x= 16, y=-13, z= 23>, vel=<x=  7, y=  1, z=  1>
      STEP100_END
                      .to_str
    }
    consts.each { |k, v| stub_const(k, v) }
    adv12.initial_positions(described_class.parse_vectors(INIT_POS))
  end

  it 'tracks the given example 2 step 0' do
    expect(adv12.group_vectors).to eq(described_class.parse_vectors(STEP0))
  end

  it 'tracks the given example 2 step 10' do
    10.times { adv12.step }
    expect(adv12.group_vectors).to eq(described_class.parse_vectors(STEP10))
  end

  it 'tracks the given example 2 step 20' do
    20.times { adv12.step }
    expect(adv12.group_vectors).to eq(described_class.parse_vectors(STEP20))
  end

  it 'tracks the given example 2 step 30' do
    30.times { adv12.step }
    expect(adv12.group_vectors).to eq(described_class.parse_vectors(STEP30))
  end

  it 'tracks the given example 2 step 40' do
    40.times { adv12.step }
    expect(adv12.group_vectors).to eq(described_class.parse_vectors(STEP40))
  end

  it 'tracks the given example 2 step 50' do
    50.times { adv12.step }
    expect(adv12.group_vectors).to eq(described_class.parse_vectors(STEP50))
  end

  it 'tracks the given example 2 step 60' do
    60.times { adv12.step }
    expect(adv12.group_vectors).to eq(described_class.parse_vectors(STEP60))
  end

  it 'tracks the given example 2 step 70' do
    70.times { adv12.step }
    expect(adv12.group_vectors).to eq(described_class.parse_vectors(STEP70))
  end

  it 'tracks the given example 2 step 80' do
    80.times { adv12.step }
    expect(adv12.group_vectors).to eq(described_class.parse_vectors(STEP80))
  end

  it 'tracks the given example 2 step 90' do
    90.times { adv12.step }
    expect(adv12.group_vectors).to eq(described_class.parse_vectors(STEP90))
  end

  it 'tracks the given example 2 step 100' do
    100.times { adv12.step }
    expect(adv12.group_vectors).to eq(described_class.parse_vectors(STEP100))
  end

  it 'calculates the total energy after step 100' do
    100.times { adv12.step }
    expect(adv12.total_energy).to eq(1940)
  end
end
