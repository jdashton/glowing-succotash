#first have an empty array

words_ary = []

#ask to type in as many words as we want one word per line

puts "Type as many words as you like. Then press enter to stop. "
#continuing until we just press enter on an empty line
while true
  word = gets.chomp
  break if word == ""
  words_ary.push(word)
end
#and then repeats the words on the next line in Alphabetical order
puts words_ary.sort