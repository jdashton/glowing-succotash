require 'minitest/autorun'
require 'rectangle'

describe Rectangle do
  before do
    @rectangle = Rectangle.new
    @rectangle.width = 2
    @rectangle.height = 4
  end

  describe '#area' do
    it 'returns 8 for 2 x 4' do
      _(@rectangle.area).must_equal 8
    end
  end

  describe '#perimeter' do
    it 'returns 12 for 2 x 4' do
      _(@rectangle.perimeter).must_equal 12
    end
  end
end

#  'Area should equal width * height')
#  'Perimeter should equal width * 2 + height * 2')
