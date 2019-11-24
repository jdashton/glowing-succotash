# program asks for starting year and a ending year

print "start year: "
start_year = gets.to_i
print "end year: "
end_year = gets.to_i
# display all years divisible by 4 between them and including them
years = (start_year..end_year)

years.each do |this_year|
  if this_year % 4 == 0 && (this_year % 100 != 0 || this_year % 400 == 0)
    puts this_year
  end
end
# exculude year divisibale by 100