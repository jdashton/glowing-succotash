# frozen_string_literal: true

require 'spec_helper'
require_relative '../advent03'

RSpec.describe Advent03 do
  subject(:adv03) { described_class.new }

  describe '#find_nearest_crossing' do
    # R8,U5,L5,D3
    # U7,R6,D4,L4 = distance 6
    it 'finds 6 for the first example' do
      wire1 = 'R8,U5,L5,D3'.split(',')
      wire2 = 'U7,R6,D4,L4'.split(',')
      expect(adv03.find_nearest_crossing(wire1, wire2)).to eq 6
    end

    # R75,D30,R83,U83,L12,D49,R71,U7,L72
    # U62,R66,U55,R34,D71,R55,D58,R83 = distance 159
    it 'finds 159 for the second example' do
      wire1 = 'R75,D30,R83,U83,L12,D49,R71,U7,L72'.split(',')
      wire2 = 'U62,R66,U55,R34,D71,R55,D58,R83'.split(',')
      expect(adv03.find_nearest_crossing(wire1, wire2)).to eq 159
    end

    # R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51
    # U98,R91,D20,R16,D67,R40,U7,R15,U6,R7 = distance 135
    it 'finds 135 for the third example' do
      wire1 = 'R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51'.split(',')
      wire2 = 'U98,R91,D20,R16,D67,R40,U7,R15,U6,R7'.split(',')
      expect(adv03.find_nearest_crossing(wire1, wire2)).to eq 135
    end
  end

  describe '#find_least_distance' do
    it 'finds 30 for the least distance in example 1' do
      wire1 = 'R8,U5,L5,D3'.split(',')
      wire2 = 'U7,R6,D4,L4'.split(',')
      adv03.find_nearest_crossing(wire1, wire2)
      expect(adv03.find_least_distance(wire1, wire2)).to eq 30
    end

    it 'finds 610 for the least distance in example 2' do
      wire1 = 'R75,D30,R83,U83,L12,D49,R71,U7,L72'.split(',')
      wire2 = 'U62,R66,U55,R34,D71,R55,D58,R83'.split(',')
      adv03.find_nearest_crossing(wire1, wire2)
      expect(adv03.find_least_distance(wire1, wire2)).to eq 610
    end

    it 'finds 410 for the third example' do
      wire1 = 'R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51'.split(',')
      wire2 = 'U98,R91,D20,R16,D67,R40,U7,R15,U6,R7'.split(',')
      adv03.find_nearest_crossing(wire1, wire2)
      expect(adv03.find_least_distance(wire1, wire2)).to eq 410
    end
  end
end
