# frozen_string_literal: true

def factorial(num)
  return 'You can\'t take the factorial of a negative number!' if num.negative?

  if num <= 1
    1
  else
    num * factorial(num - 1)
  end
end

puts factorial 3
puts factorial 30
