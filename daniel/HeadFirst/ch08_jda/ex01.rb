staff = %w[Walsh Moreno Nash Cox
           Rios Jones Gupta Hayes]
softball_team = Marshal.load(Marshal.dump(staff))

staff << 'Wagner'
softball_team << 'Zonky the Wonder Squirrel'

staff[0] << '!!'

puts 'Company staff:', staff
print "\n\n"
puts 'Company softball team:', softball_team
