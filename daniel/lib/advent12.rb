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
  attr_accessor :io, :europa, :ganymede, :callisto

  PARSER = /x=\s*(-?\d+), y=\s*(-?\d+), z=\s*(-?\d+)>/.freeze
  MOON_LIST = %i[@io @europa @ganymede @callisto].freeze
  def initialize
    MOON_LIST.each { |moon| instance_variable_set(moon, Moon.new) }
    @steps = {}
  end

  def self.parse_vectors(str)
    str.scan(PARSER).map { |ary| Vector.elements ary.map(&:to_i) }
  end

  def initial_positions(init_poss)
    MOON_LIST.each do |moon|
      instance_variable_get(moon).position = init_poss.shift
    end
  end

  def group_vectors
    MOON_LIST.each_with_object([]) do |moon, acc|
      m = instance_variable_get(moon)
      acc << m.position
      acc << m.velocity
    end
  end

  def apply_gravity
    # consider every pair of moons.
    # On each axis (x, y, and z), the velocity of each moon changes by exactly
    # +1 or -1 to pull the moons together. For example, if Ganymede has an x
    # position of 3, and Callisto has a x position of 5, then Ganymede's x
    # velocity changes by +1 (because 5 > 3) and Callisto's x velocity changes
    # by -1 (because 3 < 5). However, if the positions on a given axis are the
    # same, the velocity on that axis does not change for that pair of moons.
    MOON_LIST.combination(2).each do |a, b|
      m1 = instance_variable_get(a)
      m2 = instance_variable_get(b)
      m1.velocity += m1.position.map2(m2.position) { |e1, e2| e2 <=> e1 }
      m2.velocity += m2.position.map2(m1.position) { |e1, e2| e2 <=> e1 }
    end
  end

  def apply_velocity(moon_list = MOON_LIST)
    # add the velocity of each moon to its own position. For example, if Europa
    # has a position of x=1, y=2, z=3 and a velocity of x=-2, y=0,z=3, then its
    # new position would be x=-1, y=2, z=6. This process does not modify the
    # velocity of any moon.
    moon_list.each do |moon|
      next unless instance_variable_defined?(moon)

      m = instance_variable_get(moon)
      m.position += m.velocity
    end
  end

  def step
    apply_gravity
    apply_velocity
  end

  def total_energy
    MOON_LIST.reduce(0) do |sys_acc, m|
      moon = instance_variable_get(m)
      sys_acc + moon.pot_energy * moon.kin_energy
    end
  end

  def slice_vectors(vectors)
    as = []
    (0..2).each do |idx|
      as << vectors.map { |v| v[idx] }
    end
    as
  end

  def check_repeat(step_num)
    crnt_grps = slice_vectors(group_vectors)
    (0..2).each do |i|
      next if @steps[i]
      next unless crnt_grps[i] == @init_grps[i]

      @steps[i] = step_num
      p "Axis #{ i } repeats at #{ step_num } steps."
    end
  end

  def seek_repeat
    i = 0
    @init_grps = slice_vectors(group_vectors)
    loop do
      step
      check_repeat(i += 1)
      break if @steps.size == 3
    end
    vals = @steps.values
    vals[0].lcm(vals[1]).lcm(vals[2])
  end
end
