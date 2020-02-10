# frozen_string_literal: true

# Car
class Car
  def initialize(engine)
    @engine = engine
  end

  def rev_engine
    @engine.make_sound
  end
end

# Engine
class Engine
  def initialize(sound = 'Vroom!!')
    @sound = sound
  end

  def make_sound
    puts @sound
  end
end

engine = Engine.new
car = Car.new(engine)
car.rev_engine

# Left-over pool words:
#   create
#   @sound
