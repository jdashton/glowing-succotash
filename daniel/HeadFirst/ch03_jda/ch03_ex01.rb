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
  alias super_height= height=
  alias super_width= width=

  def width=(val)
    super
    self.super_height = val
  end

  def height=(val)
    super
    self.super_width = val
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
