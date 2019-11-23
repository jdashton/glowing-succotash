# frozen_string_literal: true

poem = [
  '"Hope" is the thing with feathers -',
  'That perches in the soul -',
  'And sings the tune without the words -',
  'And never stops - at all -'
]

greatest_length = 0
poem.each do |line|
  greatest_length = line.length if greatest_length < line.length
end

line_width = greatest_length + 2

poem.each  do |line|
  puts line.center(line_width)
end
puts 'by Emily Dickinson'.rjust(line_width)
