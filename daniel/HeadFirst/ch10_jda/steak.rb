class Steak
  include Comparable

  GRADE_SCORES = { 'Prime' => 3, 'Choice' => 2, 'Select' => 1 }.freeze

  attr_accessor :grade

  def <=>(other)
    GRADE_SCORES[grade] <=> GRADE_SCORES[other.grade]
  end

  def to_s
    "#{ grade } steak"
  end
end

prime = Steak.new
prime.grade = 'Prime'
choice = Steak.new
choice.grade = 'Choice'
select = Steak.new
select.grade = 'Select'

puts "prime > choice: #{ prime > choice }"
puts "prime < select: #{ prime < select }"
# rubocop:disable Lint/UselessComparison
puts "select == select: #{ select == select }"
puts "select <= select #{ select <= select }"
# rubocop:enable Lint/UselessComparison
puts "select >= choice: #{ select >= choice }"
print 'choice.between(select, prime): '
puts choice.between?(select, prime)

print 'select.clamp(choice..prime): '
puts select.clamp(choice..prime)
