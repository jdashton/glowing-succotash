module Friendly
  def my_method
    puts 'hello from Friendly'
  end
end

module Friendlier
  def method_two
    puts 'hello from Friendlier!!'
  end
end

class ClassOne
  include Friendly
end

class ClassTwo
  include Friendly
end

ClassOne.new.my_method
ClassTwo.new.my_method

class MyClass
  include Friendly
  include Friendlier
end

my_object = MyClass.new
my_object.my_method
my_object.method_two

class MySuperclass
end

class MySubclass < MySuperclass
  include Friendly
  include Friendlier
end

subclass_instance = MySubclass.new
subclass_instance.my_method
subclass_instance.method_two
