# frozen_string_literal: true

# Employee
class Employee
  attr_reader :name

  def name=(nom)
    raise 'Name can\'t be blank!' if nom == ''

    @name = nom
  end

  def print_name
    puts format('Name: %<name>s', name: name)
  end

  def initialize(name = 'Anonymous')
    self.name = name
  end
end

# Salaried Employee
class SalariedEmployee < Employee
  attr_reader :salary

  def salary=(sal)
    raise "A salary of #{ sal } isn\'t valid!" if sal.negative?

    @salary = sal
  end

  def print_pay_stub
    print_name
    pay_for_period = (salary / 365.0) * 14
    formatted_pay = format('$%<pay>.2f', pay: pay_for_period)
    puts "Pay This Period: #{ formatted_pay }"
  end

  def initialize(the_name = 'Anonymous', the_salary = 0.0)
    # self.name = the_name
    super(the_name)
    self.salary = the_salary
  end
end

# Hourly Employee
class HourlyEmployee < Employee
  attr_reader :hourly_wage, :hours_per_week

  def hourly_wage=(wage)
    raise "#{ wage } is not a valid value for wage." if wage.negative?

    @hourly_wage = wage
  end

  def hours_per_week=(hours)
    raise 'Hours must be positive' unless hours.positive?

    @hours_per_week = hours
  end

  def print_pay_stub
    print_name
    pay_for_period = hourly_wage * hours_per_week * 2
    formatted_pay = format('$%<pay>.2f', pay: pay_for_period)
    puts "Pay This Period: #{ formatted_pay }"
  end

  def initialize(the_name = 'Anonymous', wage = 0.0, hours = 0.0)
    super(the_name)
    self.hourly_wage = wage
    self.hours_per_week = hours
  end
end

SalariedEmployee.new('Amy Blake', 50_000).print_pay_stub

ivan    = HourlyEmployee.new('Ivan Stokes',     12.75, 25)
harold  = HourlyEmployee.new('Harold Nguyen',   12.75, 25)
tamara  = HourlyEmployee.new('Tamara Wells',    12.75, 25)
susie   = HourlyEmployee.new('Susie Powell',    12.75, 25)

edwin   = HourlyEmployee.new('Edwin Burgess',   10.50, 20)
ethel   = HourlyEmployee.new('Ethel Harris',    10.50, 20)

angela  = HourlyEmployee.new('Angela Matthews', 19.25, 30)
stewart = HourlyEmployee.new('Stewart Sanchez', 19.25, 30)
