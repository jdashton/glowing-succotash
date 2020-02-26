# Attempt to bake without heating the oven
class OvenOffError < StandardError
end

# Attempt to bake with oven empty
class OvenEmptyError < StandardError
end

# Small Oven
class SmallOven
  attr_accessor :contents

  def initialize
    @contents = nil
    @state = 'off'
  end

  def turn_on
    puts 'Turning oven on.'
    @state = 'on'
  end

  def turn_off
    puts 'Turning oven off.'
    @state = 'off'
  end

  OVEN_OFF_ERROR_STRING = 'You need to turn the oven on first!'.freeze
  OVEN_EMPTY_ERROR_STRING = "There's nothing in the oven!".freeze

  def bake
    @state == 'on' || raise(OvenOffError, OVEN_OFF_ERROR_STRING)
    @contents || raise(OvenEmptyError, OVEN_EMPTY_ERROR_STRING)

    "golden-brown #{ contents }"
  end
end

if $PROGRAM_NAME == __FILE__
  begin
    dinner = ['turkey', nil, 'pie']
    oven = SmallOven.new
    oven.turn_off
    dinner.each do |item|
      oven.contents = item
      puts "Serving #{ oven.bake }."
    rescue OvenEmptyError => e
      puts "Error: #{ e.message }"
    rescue OvenOffError
      oven.turn_on
      retry
    end
  ensure
    oven.turn_off
  end
end
