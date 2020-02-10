# frozen_string_literal: true

# Parent
class Parent
  attr_accessor :last_name

  def initialize(last_name)
    self.last_name = last_name
  end
end

# Child
class Child < Parent
  # def initialize(last_name); end
end

child = Child.new('Smith')
puts child.last_name
