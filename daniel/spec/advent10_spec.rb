# frozen_string_literal: true

require 'spec_helper'
require 'advent10'

describe Advent10 do
  subject(:adv10) { described_class.new }

  before do
    prgs = {
      'INPUT1'         => [
        '.#..#'.chars,
        '.....'.chars,
        '#####'.chars,
        '....#'.chars,
        '...##'.chars
      ],
      'OUTPUT1'        => [
        '.7..7'.chars.map(&:to_i),
        '.....'.chars.map(&:to_i),
        '67775'.chars.map(&:to_i),
        '....7'.chars.map(&:to_i),
        '...87'.chars.map(&:to_i)
      ],
      'INPUT2'         => <<~INPUT2_END
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
      'INPUT3'         => <<~INPUT3_END
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
      'INPUT4'         => <<~INPUT4_END
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
      'INPUT5'         => <<~INPUT5_END
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
                            .to_str,
      'INPUT6'         => <<~INPUT6_END
        .#....#####...#..
        ##...##.#####..##
        ##...#...#.#####.
        ..#.....X...###..
        ..#.#.....#....##
      INPUT6_END
                            .to_str,
      'DESTROY_ORDER6' =>
                          [
                            [8, 1],
                            [9, 0],
                            [9, 1],
                            [10, 0],
                            [9, 2],
                            [11, 1],
                            [12, 1],
                            [11, 2],
                            [15, 1],
                            [12, 2],
                            [13, 2],
                            [14, 2],
                            [15, 2],
                            [12, 3],
                            [16, 4],
                            [15, 4],
                            [10, 4],
                            [4, 4],
                            [2, 4],
                            [2, 3],
                            [0, 2],
                            [1, 2],
                            [0, 1],
                            [1, 1],
                            [5, 2],
                            [1, 0],
                            [5, 1],
                            [6, 1],
                            [6, 0],
                            [7, 0],
                            [8, 0],
                            [10, 1],
                            [14, 0],
                            [16, 1],
                            [13, 3],
                            [14, 3]
                          ]
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

  it 'shoots asteroids in expected order for INPUT6' do
    expect(adv10.shoot_roids(INPUT6))
      .to eq(DESTROY_ORDER6)
  end

  it 'shoots asteroids in expected order for INPUT5' do
    expect(adv10.shoot_roids(INPUT5)[199])
      .to eq([8, 2])
  end
end
