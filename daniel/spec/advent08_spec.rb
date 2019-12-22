# frozen_string_literal: true

require 'spec_helper'
require 'advent08'

describe Advent08 do
  subject(:adv08) { described_class.new }

  it 'can access WIDTH' do
    expect(described_class::WIDTH).to eq(25)
  end

  it 'can access HEIGHT' do
    expect(described_class::HEIGHT).to eq(6)
  end
end
