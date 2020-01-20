# frozen_string_literal: true

require_relative 'lib/advent12'

input =
  IO
    .read('input/advent12.txt')

adv12 = Advent12.new
adv12.initial_positions(Advent12.parse_vectors(input))
# 1000.times { adv12.step }
# p adv12.total_energy
p adv12.seek_repeat
