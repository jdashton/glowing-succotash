# frozen_string_literal: true

# Add custom `factorial` method to Integer class.
class Integer
  def factorial(num = self)
    return 'You can\'t take the factorial of a negative number!' if negative?

    if num <= 1
      1
    else
      num * factorial(num - 1)
    end
  end
end

puts 3.factorial
puts 10.factorial
