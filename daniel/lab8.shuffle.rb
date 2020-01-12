# frozen_string_literal: true

# Extend Array class with custom `shuffle()` method
class Array
  def shuffle(ary = self, idx = 0)
    return ary if idx >= ary.length

    swap_point = rand(ary.length)
    tmp = ary[swap_point]
    ary[swap_point] = ary[idx]
    ary[idx] = tmp
    shuffle(ary, idx + 1)
  end
end

pp %w[c c b b a a].shuffle
