#99 bottles of bear on the wall as 0 bottle break
num_bot = 99
while true
  
  puts  "#{num_bot} bottles of bear on the wall #{num_bot} take one down and pass it around #{num_bot - 1} bottles of bear on the wall. "
  num_bot -= 1
  break if num_bot == 0
end 