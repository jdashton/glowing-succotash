# frozen_string_literal: true

require 'spec_helper'
require_relative '../advent05'

describe Advent05 do
  subject(:adv05) { described_class.new }

  # 1,0,0,0,99 becomes 2,0,0,0,99 (1 + 1 = 2).
  it 'transforms sample 1 as expected' do
    expect(adv05.run([1, 0, 0, 0, 99]))
      .to eq([2, 0, 0, 0, 99])
  end

  # 2,3,0,3,99 becomes 2,3,0,6,99 (3 * 2 = 6).
  it 'transforms sample 2 as expected' do
    expect(adv05.run([2, 3, 0, 3, 99]))
      .to eq([2, 3, 0, 6, 99])
  end

  # 2,4,4,5,99,0 becomes 2,4,4,5,99,9801 (99 * 99 = 9801).
  it 'transforms sample 3 as expected' do
    expect(adv05.run([2, 4, 4, 5, 99, 0]))
      .to eq([2, 4, 4, 5, 99, 9801])
  end

  # 1,1,1,4,99,5,6,0,99 becomes 30,1,1,4,2,5,6,0,99.
  it 'transforms sample 4 as expected' do
    expect(adv05.run([1, 1, 1, 4, 99, 5, 6, 0, 99]))
      .to eq([30, 1, 1, 4, 2, 5, 6, 0, 99])
  end

  it 'transforms sample 0 as expected' do
    expect(adv05.run([1, 9, 10, 3, 2, 3, 11, 0, 99, 30, 40, 50]))
      .to eq([3500, 9, 10, 70, 2, 3, 11, 0, 99, 30, 40, 50])
  end

  it 'handles opcode 3' do
    allow(described_class).to receive(:gets).and_return("42\n")
    expect(adv05.run([3, 3, 99, 0])).to eq([3, 3, 99, 42])
  end

  it 'handles opcode 4' do
    expect { adv05.run([4, 3, 99, 42]) }.to output("OUTPUT: 42\n").to_stdout
  end

  it 'handles immediate parameters' do
    expect(adv05.run([1002, 4, 3, 4, 33]))
      .to eq([1002, 4, 3, 4, 99])
  end

  it 'handles negative numbers' do
    expect(adv05.run([1101, 100, -1, 4, 0]))
      .to eq([1101, 100, -1, 4, 99])
  end
end
