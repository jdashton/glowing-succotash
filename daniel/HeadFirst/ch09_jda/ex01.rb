module Motorized
  def rev_motor
    puts 'Revving motor!'
  end
end

module BatteryPowered
  attr_writer :power_level

  def power_level
    @power_level || @power_level = 0
  end

  def charge
    self.power_level += 1
  end
end

class Drill
  include BatteryPowered
  include Motorized
end

class ElectricCar
  include BatteryPowered
  include Motorized
end

class Phone
  include BatteryPowered
end

drill = Drill.new
drill.charge
puts drill.power_level

car = ElectricCar.new
car.charge
car.rev_motor

phone = Phone.new
phone.charge
phone.charge
puts phone.power_level
