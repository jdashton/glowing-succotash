require 'minitest/autorun'
require 'list_with_commas'

class TestListWithCommas < Minitest::Test
  def setup
    @list = ListWithCommas.new
  end

  def test_it_joins_two_words_with_and
    @list.items = %w[apple orange]
    assert_equal('apple and orange', @list.join)
  end

  def test_it_joins_three_words_with_commas
    @list.items = %w[apple orange pear]
    assert_equal('apple, orange, and pear', @list.join)
  end

  def test_three_join_leaves_list_unchanged
    @list.items = %w[apple orange pear]
    backup = @list.items.dup
    assert_equal('apple, orange, and pear', @list.join)
    assert_equal(backup, @list.items)
  end

  def test_it_prints_one_word_alone
    @list.items = %w[apple]
    assert_equal('apple', @list.join)
  end
end
