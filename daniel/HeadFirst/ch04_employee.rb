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

  def initialize
    @name = 'Anonymous'
    @salary = 0.0
  end

  def print_pay_stub
    # p @name, @salary
    puts "Name: #{ @name }"
    pay_for_period = (@salary / 365.0) * 14
    formatted_pay = format('$%<pay>.2f', pay: pay_for_period)
    puts "Pay This Period: #{ formatted_pay }"
  end
end

amy = Employee.new
amy.name = 'Amy Blake'
amy.salary = 50_000
amy.print_pay_stub

employee = Employee.new
employee.print_pay_stub

# kara = Employee.new
# kara.name = ''

# ben = Employee.new
# ben.salary = -246
