# frozen_string_literal: true

# MyClass
class MyClass
  def initialize(my_param)
    puts 'Got a parameter from \'new\': %s ' % my_param
  end
end

MyClass.new('hello')
