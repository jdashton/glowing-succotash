require 'minitest/autorun'

class TestMath < Minitest::Test
  def test_addition
    assert_equal(2 + 2, 4)
  end

  def test_multiplication
    assert_equal(3 * 4, 12)
  end
end
