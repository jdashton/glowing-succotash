require 'minitest/autorun'
require 'person'

# Tests for the Person class
class TestPerson < Minitest::Test
  def test_introduction
    person = Person.new
    person.name = 'Bob'
    assert_equal(person.introduction, 'Hello, my name is Bob!')
  end
end
