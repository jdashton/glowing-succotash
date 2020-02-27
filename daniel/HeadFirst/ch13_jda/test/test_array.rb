# Pool Puzzle page 417

require 'minitest/autorun'

class TestArray < Minitest::Test
  def setup
    @array = %w[a b c]
  end

  def test_length
    assert_equal(3, @array.length)
  end

  def test_last
    assert_equal('c', @array.last)
  end

  def test_join
    assert_equal('a-b-c', @array.join('-'))
  end
end

# The Pool:
# assert
# first
# 'a'
# teardown
# test
