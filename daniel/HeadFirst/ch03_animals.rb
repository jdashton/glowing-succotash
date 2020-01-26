# frozen_string_literal: true

# Animal
class Animal
  attr_reader :name, :age

  def name=(value)
    raise 'Name can\'t be blank!' if value.empty?

    @name = value
  end

  def age=(value)
    raise "An age of #{ value } isn't valid!" if value.negative?

    @age = value
  end

  def talk
    puts "#{ @name } says Bark!"
  end

  def move(destination)
    puts "#{ @name } runs to the #{ destination }."
  end

  def report_age
    puts "#{ @name } is #{ @age } years old."
  end
end

# Canines
class Dog < Animal
  def to_s
    "#{ @name } the dog, age #{ age }"
  end
end

# Felines
class Cat < Animal
  def talk
    puts "#{ @name } says Meow!"
  end
end

# Avians
class Bird < Animal
  def talk
    puts "#{ @name } says Chirp! Chirp!"
  end

  def move(destination)
    puts "#{ @name } flies to the #{ destination }."
  end
end

# Armored
class Armadillo < Animal
  def move(destination)
    puts "#{ @name } unrolls!"
    super
  end
end

lucy = Dog.new
lucy.name = 'Lucy'
lucy.age = 4

rex = Dog.new
rex.name = 'Rex'
rex.age = 2

puts lucy, rex
