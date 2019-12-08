# frozen_string_literal: true

require 'spec_helper'
require_relative '../advent06'

describe Advent06 do
  subject(:adv06) { described_class.new }

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
    DOC_END
      .lines
      .map(&:chomp)
  end

  it 'counts 1 orbit for COM)B' do
    expect(adv06.count_orbits(['COM)B'])) .to eq 1
  end

  it 'counts 3 orbits for COM)B,B)C' do
    expect(adv06.count_orbits(['COM)B', 'B)C'])) .to eq 3
  end

  it 'counts 42 orbits for the full example' do
    expect(adv06.count_orbits(input)) .to eq 42
  end
end
