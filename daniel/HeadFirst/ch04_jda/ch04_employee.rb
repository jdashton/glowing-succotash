# frozen_string_literal: true

# Employee
class Employee
  attr_reader :name

  def name=(nom)
    raise 'Name can\'t be blank!' if nom == ''

    @name = nom
  end

  def initialize(name = 'Anonymous')
    self.name = name
  end

  def print_name
    puts format('Name: %<name>s', name: name)
  end
end

# Salaried Employee
class SalariedEmployee < Employee
  attr_reader :salary

  def salary=(sal)
    raise "A salary of #{ sal } isn\'t valid!" if sal.negative?

    @salary = sal
  end

  def initialize(the_name = 'Anonymous', the_salary = 0.0)
    super(the_name)
    self.salary = the_salary
  end

  def print_pay_stub
    print_name
    pay_for_period = (salary / 365.0) * 14
    formatted_pay = format('$%<pay>.2f', pay: pay_for_period)
    puts "Pay This Period: #{ formatted_pay }"
  end
end

# Hourly Employee
class HourlyEmployee < Employee
  def self.security_guard(name)
    HourlyEmployee.new(name, 19.25, 30)
  end

  def self.cashier(name)
    HourlyEmployee.new(name, 12.75, 25)
  end

  def self.janitor(name)
    HourlyEmployee.new(name, 10.50, 20)
  end

  attr_reader :hourly_wage, :hours_per_week

  def hourly_wage=(wage)
    raise "#{ wage } is not a valid value for wage." if wage.negative?

    @hourly_wage = wage
  end

  def hours_per_week=(hours)
    raise 'Hours must be positive' unless hours.positive?

    @hours_per_week = hours
  end

  def initialize(the_name = 'Anonymous', wage = 0.0, hours = 0.0)
    super(the_name)
    self.hourly_wage = wage
    self.hours_per_week = hours
  end

  def print_pay_stub
    print_name
    pay_for_period = hourly_wage * hours_per_week * 2
    formatted_pay = format('$%<pay>.2f', pay: pay_for_period)
    puts "Pay This Period: #{ formatted_pay }"
  end
end

jane = SalariedEmployee.new('Jane Doe', 50_000)
jane.print_pay_stub

angela  = HourlyEmployee.security_guard('Angela Matthews')
ivan    = HourlyEmployee.cashier('Ivan Stokes')
angela.print_pay_stub
ivan.print_pay_stub
