# frozen_string_literal: true

def sort(ary, idx = 0)
  # p ary[idx..]
  return [] if idx >= ary.length

  ((idx + 1)...ary.length).each do |i|
    next unless ary[i].downcase < ary[idx].downcase

    # puts "swapping #{ ary[idx] } for #{ ary[i] }"
    tmp = ary[i]
    ary[i] = ary[idx]
    ary[idx] = tmp
  end

  [ary[idx]] + sort(ary, idx + 1)
end

p sort(%w[c C b B a A])
