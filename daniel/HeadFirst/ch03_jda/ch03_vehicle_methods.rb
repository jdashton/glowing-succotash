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
  def steer
    puts 'Turn front wheel.'
  end
end

# Truck
class Truck < Vehicle
  attr_accessor :cargo

  def load_bed(contents)
    puts "Securing #{ contents } in the truck bed."
    @cargo = contents
  end
end

motorocycle = Motorcycle.new
motorocycle.steer
motorocycle.accelerate
