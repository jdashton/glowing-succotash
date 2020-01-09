# frozen_string_literal: true

def stars(number)
  '*' + (number <= 1 ? '' : stars(number - 1))
end

puts stars(5)
