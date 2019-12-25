# frozen_string_literal: true

require 'spec_helper'
require 'advent10'

describe Advent10 do
  subject(:adv10) { described_class.new }

  before do
    prgs = {
      'INPUT1'  => [
        '.#..#'.split(''),
        '.....'.split(''),
        '#####'.split(''),
        '....#'.split(''),
        '...##'.split('')
      ],
      'OUTPUT1' => [
        '.7..7'.split('').map(&:to_i),
        '.....'.split('').map(&:to_i),
        '67775'.split('').map(&:to_i),
        '....7'.split('').map(&:to_i),
        '...87'.split('').map(&:to_i)
      ],
      'INPUT2'  => <<~INPUT2_END
        ......#.#.
        #..#.#....
        ..#######.
        .#.#.###..
        .#..#.....
        ..#....#.#
        #..#....#.
        .##.#..###
        ##...#..#.
        .#....####
      INPUT2_END
           .to_str,
      'INPUT3'  => <<~INPUT3_END
        #.#...#.#.
        .###....#.
        .#....#...
        ##.#.#.#.#
        ....#.#.#.
        .##..###.#
        ..#...##..
        ..##....##
        ......#...
        .####.###.
      INPUT3_END
           .to_str,
      'INPUT4'  => <<~INPUT4_END
        .#..#..###
        ####.###.#
        ....###.#.
        ..###.##.#
        ##.##.#.#.
        ....###..#
        ..#.#..#.#
        #..#.#.###
        .##...##.#
        .....#.#..
      INPUT4_END
           .to_str,
      'INPUT5'  => <<~INPUT5_END
        .#..##.###...#######
        ##.############..##.
        .#.######.########.#
        .###.#######.####.#.
        #####.##.#.##.###.##
        ..#####..#.#########
        ####################
        #.####....###.#.#.##
        ##.#################
        #####.##.###..####..
        ..######..##.#######
        ####.##.####...##..#
        .#####..#.######.###
        ##...#.##########...
        #.##########.#######
        .####.#.###.###.#.##
        ....##.##.###..#####
        .#.#.###########.###
        #.#.#.#####.####.###
        ###.##.####.##.#..##
      INPUT5_END
           .to_str
    }
    prgs.each { |k, v| stub_const(k, v) }
  end

  it 'transforms a map into a count map' do
    expect(adv10.transform(INPUT1)).to eq(OUTPUT1)
  end

  it 'finds a best location at 3,4 for INPUT1' do
    expect(adv10.search_map(INPUT1)).to eq([[3, 4], 8])
  end

  it 'finds expected values for INPUT2' do
    expect(adv10.parse_map(INPUT2)).to eq([[5, 8], 33])
  end

  it 'finds expected values for INPUT3' do
    expect(adv10.parse_map(INPUT3)).to eq([[1, 2], 35])
  end

  it 'finds expected values for INPUT4' do
    expect(adv10.parse_map(INPUT4)).to eq([[6, 3], 41])
  end

  it 'finds expected values for INPUT5' do
    expect(adv10.parse_map(INPUT5)).to eq([[11, 13], 210])
  end
end
