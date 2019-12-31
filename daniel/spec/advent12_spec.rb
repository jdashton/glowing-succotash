# frozen_string_literal: true

require 'spec_helper'
require 'advent12'
# require 'tracer'

describe Advent12 do
  subject(:adv12) { described_class.new }

  before do
    consts = {
      'INIT_POS' => <<~INIT_POS_END
        <x=-1, y=0, z=2>
        <x=2, y=-10, z=-7>
        <x=4, y=-8, z=8>
        <x=3, y=5, z=-1>
      INIT_POS_END
                      .to_str,
      'STEP0'    => <<~STEP0_END
        pos=<x=-1, y=  0, z= 2>, vel=<x= 0, y= 0, z= 0>
        pos=<x= 2, y=-10, z=-7>, vel=<x= 0, y= 0, z= 0>
        pos=<x= 4, y= -8, z= 8>, vel=<x= 0, y= 0, z= 0>
        pos=<x= 3, y=  5, z=-1>, vel=<x= 0, y= 0, z= 0>
      STEP0_END
                      .to_str,
      'STEP1'    => <<~STEP1_END
        pos=<x= 2, y=-1, z= 1>, vel=<x= 3, y=-1, z=-1>
        pos=<x= 3, y=-7, z=-4>, vel=<x= 1, y= 3, z= 3>
        pos=<x= 1, y=-7, z= 5>, vel=<x=-3, y= 1, z=-3>
        pos=<x= 2, y= 2, z= 0>, vel=<x=-1, y=-3, z= 1>
      STEP1_END
                      .to_str,
      'STEP2'    => <<~STEP2_END
        pos=<x= 5, y=-3, z=-1>, vel=<x= 3, y=-2, z=-2>
        pos=<x= 1, y=-2, z= 2>, vel=<x=-2, y= 5, z= 6>
        pos=<x= 1, y=-4, z=-1>, vel=<x= 0, y= 3, z=-6>
        pos=<x= 1, y=-4, z= 2>, vel=<x=-1, y=-6, z= 2>
      STEP2_END
                      .to_str,
      'STEP3'    => <<~STEP3_END
        pos=<x= 5, y=-6, z=-1>, vel=<x= 0, y=-3, z= 0>
        pos=<x= 0, y= 0, z= 6>, vel=<x=-1, y= 2, z= 4>
        pos=<x= 2, y= 1, z=-5>, vel=<x= 1, y= 5, z=-4>
        pos=<x= 1, y=-8, z= 2>, vel=<x= 0, y=-4, z= 0>
      STEP3_END
                      .to_str,
      'STEP4'    => <<~STEP4_END
        pos=<x= 2, y=-8, z= 0>, vel=<x=-3, y=-2, z= 1>
        pos=<x= 2, y= 1, z= 7>, vel=<x= 2, y= 1, z= 1>
        pos=<x= 2, y= 3, z=-6>, vel=<x= 0, y= 2, z=-1>
        pos=<x= 2, y=-9, z= 1>, vel=<x= 1, y=-1, z=-1>
      STEP4_END
                      .to_str,
      'STEP5'    => <<~STEP5_END
        pos=<x=-1, y=-9, z= 2>, vel=<x=-3, y=-1, z= 2>
        pos=<x= 4, y= 1, z= 5>, vel=<x= 2, y= 0, z=-2>
        pos=<x= 2, y= 2, z=-4>, vel=<x= 0, y=-1, z= 2>
        pos=<x= 3, y=-7, z=-1>, vel=<x= 1, y= 2, z=-2>
      STEP5_END
                      .to_str,
      'STEP6'    => <<~STEP6_END
        pos=<x=-1, y=-7, z= 3>, vel=<x= 0, y= 2, z= 1>
        pos=<x= 3, y= 0, z= 0>, vel=<x=-1, y=-1, z=-5>
        pos=<x= 3, y=-2, z= 1>, vel=<x= 1, y=-4, z= 5>
        pos=<x= 3, y=-4, z=-2>, vel=<x= 0, y= 3, z=-1>
      STEP6_END
                      .to_str,
      'STEP7'    => <<~STEP7_END
        pos=<x= 2, y=-2, z= 1>, vel=<x= 3, y= 5, z=-2>
        pos=<x= 1, y=-4, z=-4>, vel=<x=-2, y=-4, z=-4>
        pos=<x= 3, y=-7, z= 5>, vel=<x= 0, y=-5, z= 4>
        pos=<x= 2, y= 0, z= 0>, vel=<x=-1, y= 4, z= 2>
      STEP7_END
                      .to_str,
      'STEP8'    => <<~STEP8_END
        pos=<x= 5, y= 2, z=-2>, vel=<x= 3, y= 4, z=-3>
        pos=<x= 2, y=-7, z=-5>, vel=<x= 1, y=-3, z=-1>
        pos=<x= 0, y=-9, z= 6>, vel=<x=-3, y=-2, z= 1>
        pos=<x= 1, y= 1, z= 3>, vel=<x=-1, y= 1, z= 3>
      STEP8_END
                      .to_str,
      'STEP9'    => <<~STEP9_END
        pos=<x= 5, y= 3, z=-4>, vel=<x= 0, y= 1, z=-2>
        pos=<x= 2, y=-9, z=-3>, vel=<x= 0, y=-2, z= 2>
        pos=<x= 0, y=-8, z= 4>, vel=<x= 0, y= 1, z=-2>
        pos=<x= 1, y= 1, z= 5>, vel=<x= 0, y= 0, z= 2>
      STEP9_END
                      .to_str,
      'STEP10'   => <<~STEP10_END
        pos=<x= 2, y= 1, z=-3>, vel=<x=-3, y=-2, z= 1>
        pos=<x= 1, y=-8, z= 0>, vel=<x=-1, y= 1, z= 3>
        pos=<x= 3, y=-6, z= 1>, vel=<x= 3, y= 2, z=-3>
        pos=<x= 2, y= 0, z= 4>, vel=<x= 1, y=-1, z=-1>
      STEP10_END
                      .to_str
    }
    consts.each { |k, v| stub_const(k, v) }
    adv12.initial_positions(described_class.parse_vectors(INIT_POS))
  end

  it 'applies gravity' do
    adv12.europa.position = Vector[1, 2, 3]
    adv12.europa.velocity = Vector[-2, 0, 3]
    adv12.apply_velocity([:@europa])
    expect(adv12.europa.position).to eq Vector[-1, 2, 6]
  end

  it 'tracks the given example step 0' do
    expect(adv12.group_vectors).to eq(described_class.parse_vectors(STEP0))
  end

  it 'tracks the given example step 1' do
    adv12.step
    expect(adv12.group_vectors).to eq(described_class.parse_vectors(STEP1))
  end

  it 'tracks the given example step 2' do
    2.times { adv12.step }
    expect(adv12.group_vectors).to eq(described_class.parse_vectors(STEP2))
  end

  it 'tracks the given example step 3' do
    3.times { adv12.step }
    expect(adv12.group_vectors).to eq(described_class.parse_vectors(STEP3))
  end

  it 'tracks the given example step 4' do
    4.times { adv12.step }
    expect(adv12.group_vectors).to eq(described_class.parse_vectors(STEP4))
  end

  it 'tracks the given example step 5' do
    5.times { adv12.step }
    expect(adv12.group_vectors).to eq(described_class.parse_vectors(STEP5))
  end

  it 'tracks the given example step 6' do
    6.times { adv12.step }
    expect(adv12.group_vectors).to eq(described_class.parse_vectors(STEP6))
  end

  it 'tracks the given example step 7' do
    7.times { adv12.step }
    expect(adv12.group_vectors).to eq(described_class.parse_vectors(STEP7))
  end

  it 'tracks the given example step 8' do
    8.times { adv12.step }
    expect(adv12.group_vectors).to eq(described_class.parse_vectors(STEP8))
  end

  it 'tracks the given example step 9' do
    9.times { adv12.step }
    expect(adv12.group_vectors).to eq(described_class.parse_vectors(STEP9))
  end

  it 'tracks the given example step 10' do
    10.times { adv12.step }
    expect(adv12.group_vectors).to eq(described_class.parse_vectors(STEP10))
  end

  it 'calculates the total energy after step 10' do
    10.times { adv12.step }
    expect(adv12.total_energy).to eq(179)
  end
end
