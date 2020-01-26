# frozen_string_literal: true

# Person
class Person
  def name=(new_value)
    @storage = new_value
  end

  def name
    @storage
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
