array = [10, 5, 7, 3, 9]

first = array.shift
puts "We pulled #{ first } off the start of the array."

last = array.pop
puts "We pulled #{ last } off the end of the array."

largest = array.max
puts "The largest remaining number is #{ largest }."