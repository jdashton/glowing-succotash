module JetPropelled
  def move(destination)
    puts "Flying to #{ destination }."
  end
end

class Robot
  def move(destination)
    puts "Walking to #{ destination }."
  end
end

class TankBot < Robot
  include JetPropelled

  def move(destination)
    puts "Rolling to #{ destination }."
  end
end

class Hoverbot < Robot
  include JetPropelled
end

class FarmerBot < Robot
end

TankBot.new.move('hangar')
HoverBot.new.move('lab')
FarmerBot.new.move('field')
