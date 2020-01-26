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

# Square
class Square < Rectangle
  def width=(val)
    super
    self.height = val unless (defined? @height) && @height == val
  end

  def height=(val)
    super
    self.width = val unless (defined? @width) && @width == val
  end
end

r = Rectangle.new
r.width  = 50
r.height = 10
puts r.area

s = Square.new
s.width = 50
s.height = 10 # should override width
puts s.area
