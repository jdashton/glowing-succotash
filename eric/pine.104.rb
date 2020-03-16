# frozen_string_literal: true

class Array
  def shuffle
    arr = self
    shuf = []

    until arr.empty?
      rand_index = rand(arr.length)
      curr_index = 0
      new_arr = []
      arr.each do |item|
        if curr_index == rand_index + 1
          shuf.push item
        else
          new_arr.push item
        end
        curr_index += 1
      end
      arr = new_arr
    end
    shuf
  end
end

class Integer
  def factorial
    if self <= 1
      1
    else
      self * (self - 1).factorial

    end
  end

  def to_roman
    roman = ''
    roman += 'M' * (self        / 1000)
    roman += 'D' * (self % 1000 /  500)
    roman += 'C' * (self %  500 /  100)
    roman += 'L' * (self %  100 /   50)
    roman += 'X' * (self %   50 /   10)
    roman += 'V' * (self %   10 /    5)
    roman += 'I' * (self %    5 /    1)
  end
end

# puts [1, 2, 3, 4, 5].shuffle
puts 7.factorial
puts 1967.to_roman
