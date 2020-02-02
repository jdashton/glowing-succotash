# frozen_string_literal: true

# Employee
class Employee
  attr_reader :name, :salary

  def name=(nom)
    raise 'Name can\'t be blank!' if nom == ''

    @name = nom
  end

  def salary=(sal)
    raise "A salary of #{ sal } isn\'t valid!" if sal.negative?

    @salary = sal
  end

  def initialize(the_name = 'Anonymous', the_salary = 0.0)
    self.name = the_name
    self.salary = the_salary
  end

  def print_pay_stub
    # p @name, @salary
    puts "Name: #{ name }"
    pay_for_period = (salary / 365.0) * 14
    formatted_pay = format('$%<pay>.2f', pay: pay_for_period)
    puts "Pay This Period: #{ formatted_pay }"
  end
end

Employee.new('Amy Blake', 50_000).print_pay_stub
