class Rectangle
  attr_accessor :width, :height

  def area
    width * height
  end

  def perimeter
    (width + height) * 2
  end
end
