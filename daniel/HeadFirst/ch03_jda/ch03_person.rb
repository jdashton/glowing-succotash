# frozen_string_literal: true

# Person
class Person
  def name=(new_value)
    @storage = new_value
  end

  def name
    @storage
  end

  def greeting_by_name(name)
    "Hello, #{ name }!"
  end
end

# Friend
class Friend < Person
  def greeting_by_name(name)
    basic_greeting = super
    "#{ basic_greeting } Glad to see you!"
  end
end

# Employee
class Employee < Person
  def salary=(new_value)
    @storage = new_value
  end

  def salary
    @storage
  end
end

employee = Employee.new
employee.name = 'John Smith'
employee.salary = 80_000
puts employee.name
