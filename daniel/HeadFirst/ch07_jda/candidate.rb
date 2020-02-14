# frozen_string_literal: true

# The Candidate class
class Candidate
  attr_reader :name, :age, :occupation, :hobby, :birthplace

  def initialize(name, options = {})
    self.name = name
    self.age = options[:age]
    self.occupation = options[:occupation]
    self.hobby = options[:hobby]
    self.birthplace = options[:birthplace]
  end

  private
  attr_writer :name, :age, :occupation, :hobby, :birthplace

end

candidate = Candidate.new('Amy Nguyen',
                          age: 37,
                   occupation: 'Engineer',
                        hobby: 'Lacrosse',
                   birthplace: 'Seattle')
pp candidate
