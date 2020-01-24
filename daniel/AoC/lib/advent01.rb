# frozen_string_literal: true

# Defines module fuel requirements
class Advent01
  # to find the fuel required for a module, take its mass, divide by three,
  # round down, and subtract 2.
  def fuel(mass)
    f = [mass / 3 - 2, 0].max
    f + (f.positive? ? fuel(f) : 0)
  end

  def total_fuel(masses)
    masses.reduce(0) { |total, mass| total + fuel(mass) }
  end
end
