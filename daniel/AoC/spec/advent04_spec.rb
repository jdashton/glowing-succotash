# frozen_string_literal: true

require 'spec_helper'
require_relative '../advent04'

RSpec.describe Advent04 do
  subject(:adv04) { described_class.new }

  it 'fails 111111 for doubled digits' do
    expect(adv04.doubled_digits?(111_111.to_s)).to be false
  end

  it 'passes 223450 for doubled digits' do
    expect(adv04.doubled_digits?(223_450.to_s)).to be true
  end

  it 'fails 123789 for doubled digits' do
    expect(adv04.doubled_digits?(123_789.to_s)).to be false
  end

  it 'fails 123444 for doubled digits' do
    expect(adv04.doubled_digits?(123_444.to_s)).to be false
  end

  it 'passes 111111 for no descending digits' do
    expect(adv04.descending_digits?(111_111.to_s)).to be false
  end

  it 'fails 223450 for no descending digits' do
    expect(adv04.descending_digits?(223_450.to_s)).to be true
  end

  it 'passes 123789 for no descending digits' do
    expect(adv04.descending_digits?(123_789.to_s)).to be false
  end

  it 'fails 111111 for meets_criteria?' do
    expect(adv04.meets_criteria?(111_111.to_s)).to be false
  end

  it 'fails 223450 for meets_criteria?' do
    expect(adv04.meets_criteria?(223_450.to_s)).to be false
  end

  it 'fails 123789 for meets_criteria?' do
    expect(adv04.meets_criteria?(123_789.to_s)).to be false
  end

  it 'passes 112233 for meets_criteria?' do
    expect(adv04.meets_criteria?(112_233.to_s)).to be true
  end

  it 'fails 123444 for meets_criteria?' do
    expect(adv04.meets_criteria?(123_444.to_s)).to be false
  end

  it 'passes 111122 for meets_criteria?' do
    expect(adv04.meets_criteria?(111_122.to_s)).to be true
  end
end
