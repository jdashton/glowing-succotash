# frozen_string_literal: true

# MyClass
class MyClass
  def first_method
    puts "Current instance within first_method: #{ self }"
    second_method
  end

  def second_method
    puts "Current instance within second_method: #{ self }"
  end
end

my_object = MyClass.new
puts "my_object refers to this object: #{ my_object }"
my_object.first_method
