# frozen_string_literal: true

# Rectangle
class Rectangle
  attr_reader :width, :height

  def width=(val)
    raise 'width cannot be negative' if val.negative?

    @width = val
  end

  def height=(val)
    raise 'height cannot be negative' if val.negative?

    @height = val
  end

  def initialize(width, height)
    self.width = width
    self.height = height
  end

  def area
    width * height
  end
end

rectangle = Rectangle.new(2, 4)
puts rectangle.area
