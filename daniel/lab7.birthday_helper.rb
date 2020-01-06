# frozen_string_literal: true

require 'date'

bday_ary = File.read('input/birthdays.txt').each_line.map do |line|
  name, birthday = line.chomp.split(/,\s*/, 2)
  [name, Date.parse(birthday)]
end
bday_hash = Hash[bday_ary]
p bday_hash

puts
print 'Whose birthday do you seek? '
name = gets.chomp
puts
bday = bday_hash[name]
# p bday

unless bday
  puts "No person known by the name \"#{ name }\"."
  return
end

today = Date.today
bday_this_year = Date.new(today.year, bday.month, bday.day)
if bday_this_year == today
  puts "Today is #{ name }'s birthday! He is turning " \
       "#{ today.year - bday.year } years old."
else
  bday_this_year = bday_this_year.next_year if bday_this_year < today

  puts "The next birthday for #{ name } is " \
       "#{ bday_this_year.strftime('%B %-e') }.  He will be turning " \
       "#{ bday_this_year.year - bday.year } years old."
end
puts
