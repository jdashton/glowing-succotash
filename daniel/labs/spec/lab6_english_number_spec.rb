# frozen_string_literal: true

require 'spec_helper'
require_relative '../lab6_english_number'

VARIOUS = {
  0                 => 'zero',
  9                 => 'nine',
  10                => 'ten',
  11                => 'eleven',
  17                => 'seventeen',
  32                => 'thirty-two',
  88                => 'eighty-eight',
  99                => 'ninety-nine',
  100               => 'one hundred',
  101               => 'one hundred one',
  234               => 'two hundred thirty-four',
  1000              => 'one thousand',
  1001              => 'one thousand one',
  3211              => 'three thousand two hundred eleven',
  999_999           => 'nine hundred ninety-nine thousand '\
                       'nine hundred ninety-nine',
  1_000_001         => 'one million one',
  1_001_001         => 'one million one thousand one',
  100_000_000       => 'one hundred million',
  1_000_000_000_000 => 'one trillion',
  1_234_567_890_123 => 'one trillion two hundred thirty-four '\
                       'billion five hundred sixty-seven million '\
                       'eight hundred ninety thousand one hundred '\
                       'twenty-three'
}.freeze

describe Lab6EnglishNumber do
  subject(:lab) { described_class.new }

  it 'tests english' do
    VARIOUS.each do |k, v|
      expect(lab.convert(k)).to eq v
    end
  end
end
