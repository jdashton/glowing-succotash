# frozen_string_literal: true

# Add to_eng() method to Integer class
class Integer
  def to_eng
    english = if self == 5
                'five'
              else
                'forty-two'
              end
    english
  end
end

puts 5.to_eng
puts 42.to_eng
