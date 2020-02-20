module JetPropelled
  def initialize
    puts 'in JetPropelled#initialize'
    super
  end

  def move(destination)
    puts "Flying to #{ destination }."
  end
end

class Robot
  def initialize
    puts 'in Robot#initialize'
  end

  def move(destination)
    puts "Walking to #{ destination }."
  end
end

class TankBot < Robot
  include JetPropelled

  def initialize
    puts 'in TankBot#initialize'
    super
  end

  def move(destination)
    puts "Rolling to #{ destination }."
  end
end

class HoverBot < Robot
  include JetPropelled
end

class FarmerBot < Robot
end

TankBot.new.move('hangar')
HoverBot.new.move('lab')
FarmerBot.new.move('field')

p TankBot.ancestors
p JetPropelled.ancestors
p Robot.ancestors
