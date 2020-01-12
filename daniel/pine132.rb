# frozen_string_literal: true

# Simple Die class, rolls 1 in 6
class Die
  def roll
    rand(1..6)
  end
end

dice = [Die.new, Die.new]

dice.each { |die| puts die.roll }
