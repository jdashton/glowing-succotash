# frozen_string_literal: true

# Rectangle
class Rectangle
  attr_accessor :width, :height

  def area
    width * height
  end
end

r = Rectangle.new
r.width = 50
r.height = 10
puts r.area
