def year
  year = rand(1930..1950)
end
# Grandma
puts "HELLO! HOW'S MY FAVORET GRANDCHILD?"
while true
word = gets.chomp
   if word == word.upcase
    puts "OH, NOT SINCE #{year}!"
   elsif word == word
    puts "HUH?! SPEEK UP SONNY!"
   end
  break if word == "BYE"
end 
puts "OK BYE!"

#greeting
  # hi
  # loop , HUH?
  # HI!
  # OH not since 1934!
  # DO YOU LIKE COFFIE?
  # OH, NOT SINCE 1934!
  # what? 
  # HUH?
  # BYE
  # OK BYE!