# frozen_string_literal: true

require 'matrix'

# Data specific to a moon in orbit
class Moon
  attr_accessor :position, :velocity

  def initialize
    @velocity = Vector.zero(3)
  end

  def energy(vector)
    vector.map(&:abs).sum
  end

  def pot_energy
    energy @position
  end

  def kin_energy
    energy @velocity
  end
end

# Simulate orbits of four moons
class Advent12
  PARSER = /x=\s*(-?\d+), y=\s*(-?\d+), z=\s*(-?\d+)>/.freeze

  def initialize
    @moons = Array.new(4) { |_| Moon.new }
    @steps = {}
  end

  # Useful for testing velocity
  def europa
    # IO, Europa, Ganymede, Callisto
    @moons[1]
  end

  # Convert input or test data to arrays of vectors.
  def self.parse_vectors(str)
    str.scan(PARSER).map { |ary| Vector.elements ary.map(&:to_i) }
  end

  # Takes an array of initial position vectors, and assigns one to each moon.
  def initial_positions(init_poss)
    @moons.each { |moon| moon.position = init_poss.shift }
  end

  # Bring together all the positions and velocities for easy comparison.
  def group_vectors
    @moons.each_with_object([]) { |m, acc| acc << m.position << m.velocity }
  end

  def apply_gravity
    # consider every pair of moons.
    # On each axis (x, y, and z), the velocity of each moon changes by exactly
    # +1 or -1 to pull the moons together. For example, if Ganymede has an x
    # position of 3, and Callisto has a x position of 5, then Ganymede's x
    # velocity changes by +1 (because 5 > 3) and Callisto's x velocity changes
    # by -1 (because 3 < 5). However, if the positions on a given axis are the
    # same, the velocity on that axis does not change for that pair of moons.
    @moons.combination(2).each do |m1, m2|
      m1.velocity += m1.position.map2(m2.position) { |e1, e2| e2 <=> e1 }
      m2.velocity += m2.position.map2(m1.position) { |e1, e2| e2 <=> e1 }
    end
  end

  def apply_velocity
    # add the velocity of each moon to its own position. For example, if Europa
    # has a position of x=1, y=2, z=3 and a velocity of x=-2, y=0,z=3, then its
    # new position would be x=-1, y=2, z=6. This process does not modify the
    # velocity of any moon.
    @moons.each { |m| m.position += m.velocity }
  end

  # Move the moons by a single calculation step.
  def step
    apply_gravity
    apply_velocity
  end

  def total_energy
    @moons.reduce(0) { |sys_acc, m| sys_acc + m.pot_energy * m.kin_energy }
  end

  # Split the grouped vectors in to X, Y and Z groups of integers.
  def slice_vectors(vectors)
    as = []
    (0..2).each do |idx|
      as << vectors.map { |v| v[idx] }
    end
    as
  end

  # Look for a return to initial state on each axis. Record shortest cycle.
  def check_repeat(step_num)
    crnt_grps = slice_vectors(group_vectors)
    (0..2).each do |i|
      next if @steps[i]
      next unless crnt_grps[i] == @init_grps[i]

      @steps[i] = step_num
      puts "Axis #{ i } repeats at #{ step_num } steps."
    end
  end

  # Run the simulation forward until a repeating cycle length has been found
  # for each axis. Total cycle length for all three axes together will be least
  # common multiple of the individual axis cycle lengths.
  def seek_repeat
    i = 0
    @init_grps = slice_vectors(group_vectors)
    while @steps.size < 3
      step
      check_repeat(i += 1)
    end
    vals = @steps.values
    vals[0].lcm(vals[1]).lcm(vals[2])
  end
end
