# frozen_string_literal: true

def shuffle(ary, idx = 0)
  return ary if idx >= ary.length

  swap_point = rand(ary.length)
  tmp = ary[swap_point]
  ary[swap_point] = ary[idx]
  ary[idx] = tmp
  shuffle(ary, idx + 1)
end

p shuffle(%w[c c b b a a])
