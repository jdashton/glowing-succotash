# frozen_string_literal: true

# Defines module fuel requirements
class Advent2
  # Implement an IntCode computer
  def run(prg_ary)
    prg_ary.each_slice(4) do |a|
      break unless [1, 2].include? a[0]

      prg_ary[a[3]] =
        prg_ary[a[1]].send(
          a[0] == 1 ? :+ : :*,
          prg_ary[a[2]]
        )
    end
    prg_ary
  end
end

input = [1, 0, 0, 3, 1, 1, 2, 3, 1, 3, 4, 3, 1, 5, 0, 3, 2, 1, 10, 19, 1, 6, 19,
         23, 2, 23, 6, 27, 2, 6, 27, 31, 2, 13, 31, 35, 1, 10, 35, 39, 2, 39,
         13, 43, 1, 43, 13, 47, 1, 6, 47, 51, 1, 10, 51, 55, 2, 55, 6, 59, 1, 5,
         59, 63, 2, 9, 63, 67, 1, 6, 67, 71, 2, 9, 71, 75, 1, 6, 75, 79, 2, 79,
         13, 83, 1, 83, 10, 87, 1, 13, 87, 91, 1, 91, 10, 95, 2, 9, 95, 99, 1,
         5, 99, 103, 2, 10, 103, 107, 1, 107, 2, 111, 1, 111, 5, 0, 99, 2, 14,
         0, 0]

adv2 = Advent2.new
input[1] = 12
input[2] = 2
output = adv2.run(input)
puts output[0]
