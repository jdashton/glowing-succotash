# frozen_string_literal: true

require 'spec_helper'
require_relative '../advent06'

describe Advent06 do
  let(:input) do
    <<~DOC_END
      COM)B
      B)C
      C)D
      D)E
      E)F
      B)G
      G)H
      D)I
      E)J
      J)K
      K)L
    DOC_END
      .lines
      .map(&:chomp)
  end

  let(:input2) do
    <<~DOC_END
      COM)B
      B)C
      C)D
      D)E
      E)F
      B)G
      G)H
      D)I
      E)J
      J)K
      K)L
      K)YOU
      I)SAN
    DOC_END
      .lines
      .map(&:chomp)
  end

  it 'counts 1 orbit for COM)B' do
    adv06 = described_class.new(['COM)B'])
    expect(adv06.count_orbits) .to eq 1
  end

  it 'counts 3 orbits for COM)B,B)C' do
    adv06 = described_class.new(['COM)B', 'B)C'])
    expect(adv06.count_orbits) .to eq 3
  end

  it 'counts 42 orbits for the full example' do
    adv06 = described_class.new(input)
    expect(adv06.count_orbits).to eq 42
  end

  it 'counts 4 move from YOU to SAN' do
    adv06 = described_class.new(input2)
    expect(adv06.count_moves).to eq 4
  end
end
