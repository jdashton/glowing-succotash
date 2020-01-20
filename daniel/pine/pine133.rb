# frozen_string_literal: true

# Simple Die class, rolls 1 in 6
class Die
  def roll
    @number_showing = rand(1..6)
  end

  def showing
    @number_showing
  end
end

die = Die.new
die.roll
puts die.showing
puts die.showing
die.roll
puts die.showing
puts die.showing
