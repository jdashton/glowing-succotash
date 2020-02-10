# frozen_string_literal: true

# MyClass
class MyClass
  def self.my_class_method(par1, par2)
    puts 'Hello from MyClass!'
    puts "My parameters: #{ par1 }, #{ par2 }"
  end
end

MyClass.my_class_method('my p1 val', 'my p2 val')
