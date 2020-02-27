require 'rectangle'

RSpec.describe Rectangle do
  before do
    @rectangle = described_class.new
    @rectangle.width = 2
    @rectangle.height = 4
  end

  describe '#area' do
    it 'returns 8 for 2 x 4' do
      expect(@rectangle.area).to eq 8
    end
  end

  describe '#perimeter' do
    it 'returns 12 for 2 x 4' do
      expect(@rectangle.perimeter).to eq 12
    end
  end
end

#  'Area should equal width * height')
#  'Perimeter should equal width * 2 + height * 2')
