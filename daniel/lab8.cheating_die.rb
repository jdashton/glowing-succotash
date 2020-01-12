# frozen_string_literal: true

# Simple Die class, rolls 1 in 6
class Die
  def initialize
    roll
  end

  def roll
    @number_showing = rand(1..6)
  end

  def showing
    @number_showing
  end

  def face=(num)
    raise "impossible value" unless (1..6) === num
    @number_showing = num
  end
end

puts Die.new.face = 6
