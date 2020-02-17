class Grade
  include Comparable

  LETTER_GRADES = %w[A B C D F].freeze

  attr_reader :letter

  def initialize(let)
    self.letter = let
  end

  def letter=(let)
    unless LETTER_GRADES.include?(let)
      raise "Not a valid letter grade: #{ let }"
    end

    @letter = let
  end

  def <=>(other)
    0 - (letter <=> other.letter)
  end
end

a_grade = Grade.new('A')
b_grade = Grade.new('B')
c_grade = Grade.new('C')
d_grade = Grade.new('D')
f_grade = Grade.new('F')

puts "a_grade > c_grade: #{ a_grade > c_grade }"
puts "f_grade < d_grade: #{ f_grade < d_grade }"
puts "b_grade > a_grade: #{ b_grade > a_grade }"
# rubocop:disable Lint/UselessComparison
puts "a_grade == a_grade: #{ a_grade == a_grade }"
# rubocop:enable Lint/UselessComparison
