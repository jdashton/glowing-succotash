# frozen_string_literal: true

def print_sum(arg1, arg2)
  print arg1 + arg2
end

def print_area(length, width)
  puts length * width
end

def order_soda(flavor, size = 'medium', quantity = 1)
  plural = quantity == 1 ? 'soda' : 'sodas'
  puts "#{ quantity } #{ size } #{ flavor } #{ plural }, coming right up!"
end

def accelerate
  puts 'Stepping on the gas'
  puts 'Speeding up'
end

def sound_horn
  puts 'Pressing the horn button'
  puts 'Beep beep!'
end

def use_headlights(brightness = 'low-beam')
  puts "Turning on #{ brightness } headlights"
  puts 'Watch out for deer!'
end

def mileage(miles_driven, gas_used)
  return 0.0 if gas_used.zero?

  miles_driven / gas_used
end

sound_horn
accelerate
use_headlights
use_headlights 'high-beam'

order_soda 'orange'
order_soda 'lemon-lime', 'small', 2
order_soda 'grape', 'large'

trip_mileage = mileage(400, 12)
puts "You got #{ trip_mileage } MPG on this trip."

lifetime_mileage = mileage(11_432, 366)
puts "This car averages #{ lifetime_mileage } MPG."
