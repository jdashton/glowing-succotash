# frozen_string_literal: true

my_bday = Time.local(1967, 9, 24)
this_year = Time.now.year

tmp_bday = my_bday.to_a
tmp_bday[5] = this_year
my_bday_this_year = Time.local(*tmp_bday)

num_years = this_year - my_bday.year - (my_bday_this_year > Time.now ? 1 : 0)

puts num_years.to_s + ' birthdays means ' + num_years.to_s + ' spanks!'
num_years.times do |_|
  print ' SPANK! '
end
puts
