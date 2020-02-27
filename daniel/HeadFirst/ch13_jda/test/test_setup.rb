require 'minitest/autorun'
require_relative '../../ch12_jda/small_oven'

class TestSetup < MiniTest::Test
  def setup
    @oven = SmallOven.new
    @oven.turn_on
  end

  def teardown
    @oven.turn_off
  end

  def test_one
    @oven.contents = 'turkey'
    assert_equal('golden-brown turkey', @oven.bake)
  end

  def test_two
    @oven.contents = nil
    assert_raises(OvenEmptyError) { @oven.bake }
  end
end
