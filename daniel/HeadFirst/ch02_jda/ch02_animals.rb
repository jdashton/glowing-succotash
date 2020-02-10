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

# Felines
class Cat
  def talk(name)
    puts "#{ name } says Meow!"
  end

  def move(name, destination)
    puts "#{ name } runs to the #{ destination }."
  end
end

dog = Dog.new
dog.name = 'Daisy'
dog.age = 3
dog.report_age
dog.talk
dog.move 'bed'
