def year
    year = rand(1930..1950)
  end
  # Grandma
  puts "HELLO! HOW'S MY FAVORET GRANDCHILD?"
  num = 0
  while true
    word = gets.chomp
      if word == "BYE"
        num = num + 1
        puts "SAY AGAIN?"
        break if num == 3
      elsif word == word.upcase
        puts "OH, NOT SINCE #{year}!"
        num = 0
      else 
        puts "HUH?! SPEEK UP SONNY!"
        num = 0
     end
  end 
  puts "OK BYE!"
  