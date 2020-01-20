# frozen_string_literal: true

# FFT pattern application
class Advent16
  attr_reader :i_s

  def initialize(input_signal)
    @next_buf = input_signal
    @is_len = @next_buf.length
    @last_element = @is_len - 1
    @last_changing = @is_len - 2
    @half = @is_len / 2
    @third = @is_len / 3
    @pats = {}
    self.target = 0
    reset
  end

  def target=(tgt)
    @target = tgt
    @half_stop = [@target, @half].max
    @third_stop = [@target, @third].max
    @top_half = @target >= @half_stop
    @top_two_thirds = @target >= @third
    @top_half_enumerator = @last_changing.downto(@half_stop)
    @next_sixth_enumerator = (@half - 1).downto(@third_stop)
    @last_third_enumerator = (@third - 1).downto(@target)
  end

  def reset
    @i_s = @next_buf
    @next_buf = []
    @next_buf[@last_element] = @i_s[@last_element] # last element never changes
  end

  def gen(first_element, len = @is_len)
    return @pats[first_element] if @pats[first_element]

    @pats[first_element] = { add: [], sub: [] }
    adding = false
    ((first_element...len) % (first_element + 1)).each_slice(2) do |(i, j)|
      adding = !adding
      @pats[first_element][adding ? :add : :sub] << (i...j)
    end
    @pats[first_element]
  end

  def apply_pat(idx)
    p = gen(idx)
    (
      p[:add].reduce(0) { |acc, range| acc + @i_s[range].sum } -
      p[:sub].reduce(0) { |acc, range| acc + @i_s[range].sum }
    ).abs % 10
  end

  def calc_bottom_third
    @last_third_enumerator.each { |i| @next_buf[i] = apply_pat(i) }
  end

  def calc_second_half
    @next_sixth_enumerator.each do |i|
      @next_buf[i] =
        (@i_s[i] + @next_buf[i + 1] - @i_s[i * 2 + 1, 2].sum) % 10
    end
    calc_bottom_third unless @top_two_thirds
  end

  def calc_full_phase
    # @last_changing.downto(@half_stop) do |i|
    @top_half_enumerator.each do |i|
      @next_buf[i] = (@i_s[i] + @next_buf[i + 1]) % 10
    end
    calc_second_half unless @top_half
  end

  def run(num_phases = 100)
    num_phases.times do
      calc_full_phase
      reset
    end
    @i_s
  end

  def run10k
    self.target = @i_s[0, 7].join.to_i
    run
    @i_s[@target, 8]
  end
end
