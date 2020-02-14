# frozen_string_literal: true

# The Candidate class
class Candidate
  attr_reader :name, :age, :occupation, :hobby, :birthplace

  def initialize(name, age:, occupation:, hobby: nil,
                 birthplace: 'Sleepy Creek')
    self.name = name
    self.age = age
    self.occupation = occupation
    self.hobby = hobby
    self.birthplace = birthplace
  end

  private

  attr_writer :name, :age, :occupation, :hobby, :birthplace
end

candidate = Candidate.new('Amy Nguyen',
                          age: 37,
                   occupation: 'Engineer')
#       hobby: 'Lacrosse',
#  birthplace: 'Seattle')
pp candidate
