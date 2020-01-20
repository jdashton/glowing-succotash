# frozen_string_literal: true

require 'spec_helper'
require 'advent08'

describe Advent08 do
  subject(:adv08) { described_class.new }

  let(:two_layers) do
    <<~DOC_END
      211202121222222222221222212222202022222222222122221220222222222222222222222202222222222222122121022222212222222222212212222222210222202212222222012222200222021222222222220222222222202222222222222022220221222222222222222222222222222222222222022022022222222222222222222212222222221222222202220222202222
    DOC_END
  end

  it 'can access WIDTH' do
    expect(described_class::WIDTH).to eq(25)
  end

  it 'can access HEIGHT' do
    expect(described_class::HEIGHT).to eq(6)
  end

  it 'counts the digits in each layer' do
    expect(adv08.fewest_zeros(two_layers))
      .to eq(2108)
  end

  # 0 is black, 1 is white, and 2 is transparent
  # If a given position has a transparent pixel in the first and second layers,
  # a black pixel in the third layer, and a white pixel in the fourth layer,
  # the final image would have a black pixel at that position.
  it 'composits transparent pixels' do
    expect(adv08.composite([[2], [2], [0], [1]])).to eq([0])
  end

  it 'composits another transparent pixels' do
    expect(adv08.composite([[2], [2], [1], [0]])).to eq([1])
  end

  it 'composits a 4-layer example' do
    expect(adv08.process('0222112222120000', 2, 2)).to eq('0110')
  end
end
