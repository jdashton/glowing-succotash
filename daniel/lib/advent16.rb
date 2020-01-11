# frozen_string_literal: true

require 'matrix'

# Maze traversal for Intcode-controlled repair droid
class Advent16
  attr_reader :i_s
  attr_writer :target

  def initialize(input_signal)
    @i_s = input_signal
    @is_len = @i_s.length
    @half = @is_len / 2
    @third = @is_len / 3
    @pats = {}
    @target = 0
    reset(true)
  end

  def reset(init = false)
    @i_s = @next_buffer unless init
    @next_buffer = []
    @next_buffer[@is_len - 1] = @i_s[@is_len - 1]
  end

  def gen(idx, len)
    return @pats[idx] if @pats[idx]

    offset = idx + 1
    pat = { add: [], sub: [] }
    adding = true
    while idx < len
      pat[adding ? :add : :sub] += (idx...(idx += offset)).to_a
      idx += offset
      adding = !adding
    end
    @pats[idx] = pat.each_value { |v| v.filter! { |i| i < len } }
  end

  def apply_pat(idx)
    p = gen(idx, @is_len)
    adds = p[:add].reduce(0) { |acc, i| acc + @i_s[i] }
    subs = p[:sub].reduce(0) { |acc, i| acc + @i_s[i] }
    (adds - subs).abs % 10
  end

  def calc(idx)
    return (@i_s[idx] + @next_buffer[idx + 1]) % 10 if idx >= @half

    # elsif idx >= @third
    #   (@i_s[idx] +
    #     @next_buffer[idx + 1] -
    #     @i_s[idx * 2 + 1] -
    #    (@i_s[idx * 2 + 2] || 0)) % 10
    # else
    apply_pat(idx)
    # end
  end

  def calc_full_phase(start = 0)
    stop = [start, @half].max
    (@is_len - 2).downto(stop) do |idx|
      @next_buffer[idx] = (@i_s[idx] + @next_buffer[idx + 1]) % 10
    end
    return if start >= @half

    (@half - 1).downto(start) do |idx|
      @next_buffer[idx] = calc(idx)
    end
  end

  def run(num_phases = 100)
    num_phases.times do
      calc_full_phase(@target)
      reset
    end
    @i_s
  end

  def run10k
    @target = @i_s[0, 7].join.to_i
    run
    @i_s[@target, 8]
  end
end
