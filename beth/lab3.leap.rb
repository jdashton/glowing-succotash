# frozen_string_literal: true

print 'enter a starting year: '
year1 = gets.to_i
print 'enter an ending year: '
year2 = gets.to_i

# leap years are divisible by 4
# except when they are divisible by 100
# EXCEPT when they are divisible by 400

# puts all_years

# then, we'll make a function to find if it's a leap year

def leap?(year)
  (year % 400).zero? ||
    year % 100 != 0 && (year % 4).zero?
end

(year1..year2).each do |this_year|
  puts this_year if leap?(this_year)
end
