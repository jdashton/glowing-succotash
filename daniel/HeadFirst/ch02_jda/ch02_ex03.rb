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

  def area
    width * height
  end
end

r = Rectangle.new
r.width  = 50
r.height = 10
puts r.area
