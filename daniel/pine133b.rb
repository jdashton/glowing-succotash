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
end

puts Die.new.showing
