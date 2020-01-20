# frozen_string_literal: true

# Add `each_even` to Array class
class Array
  def each_even
    is_even = true

    each do |object|
      yield(object) if is_even

      is_even = !is_even
    end
  end
end

fruits = %w[apple bad\ apple cherry durian]
fruits.each_even do |fruit|
  puts "Yum!  I just love #{ fruit } pies, don't you?"
end

[1, 2, 3, 4, 5].each_even do |odd_ball|
  puts "#{ odd_ball } is NOT an even number!"
end
