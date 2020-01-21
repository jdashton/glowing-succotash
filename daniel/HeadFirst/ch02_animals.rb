# frozen_string_literal: true

# Avians
class Bird
  def talk(name)
    puts "#{ name } says Chirp! Chirp!"
  end

  def move(name, destination)
    puts "#{ name } flies to the #{ destination }."
  end
end

# Canines
class Dog
  attr_accessor :name, :age

  def report_age
    puts "#{ @name } is #{ @age } years old."
  end

  def talk
    puts "#{ @name } says Bark!"
  end

  def move(destination)
    puts "#{ @name } runs to the #{ destination }."
  end
end

# Felines
class Cat
  def talk(name)
    puts "#{ name } says Meow!"
  end

  def move(name, destination)
    puts "#{ name } runs to the #{ destination }."
  end
end

fido = Dog.new
fido.name = 'Fido'
fido.age = 2
rex = Dog.new
rex.name = 'Rex'
rex.age = 3
fido.report_age
rex.report_age
