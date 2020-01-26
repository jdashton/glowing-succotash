# frozen_string_literal: true

# Vehicle
class Vehicle
  attr_accessor :odometer, :gas_used

  def accelerate
    puts 'Floor it!'
  end

  def sound_horn
    puts 'Beep! Beep!'
  end

  def steer
    puts 'Turn front 2 wheels.'
  end

  def mileage
    @odometer / @gas_used
  end
end

# Car
class Car < Vehicle
end

# Motorcycle
class Motorcycle < Vehicle
end

# Truck
class Truck < Vehicle
  attr_accessor :cargo

  def load_bed(contents)
    puts "Securing #{ contents } in the truck bed."
    @cargo = contents
  end
end

truck = Truck.new
truck.load_bed('259 bouncy balls')
puts "The truck is carrying #{ truck.cargo }."
