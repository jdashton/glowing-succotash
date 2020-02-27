require 'minitest/autorun'

# Let's test some maths
class TestMath < Minitest::Test
  def test_truth
    assert(2 + 2 == 4)
  end

  def test_fallacy
    assert(2 + 2 == 5)
  end
end
