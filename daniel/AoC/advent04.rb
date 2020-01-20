# frozen_string_literal: true

# Check potential passwords
class Advent04
  def doubled_digits?(int_str)
    (0..4).each do |i|
      return true if int_str[i] == int_str[i + 1] &&
                     (int_str[i] != int_str[i - 1]) &&
                     (int_str[i] != int_str[i + 2])
    end
    false
  end

  def descending_digits?(int_str)
    (0..4).each do |i|
      return true if int_str[i] > int_str[i + 1]
    end
    false
  end

  def meets_criteria?(some_int)
    int_str = "#{ some_int } "
    doubled_digits?(int_str) && !descending_digits?(int_str)
  end
end

input = <<~DOC_END
  165432-707912
DOC_END
          .lines
          .map { |l| l.split('-').map(&:to_i) }
          .flatten

p input
adv4 = Advent04.new
tally = 0
(input[0]..input[1]).each do |i|
  tally += 1 if adv4.meets_criteria?(i)
end
puts tally
