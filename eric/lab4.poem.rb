poem = [
"Old Mother Hubbard ",
"Sat in her cupboard, ",
"Eating her curds and whey, ",
"When along came a spider, ",
"Who sat down beside her, ",
"And sacred her poor shoe dog away. ",
]
# calc each in poem 
greatest_length = 0

poem.each do |line|
  if greatest_length < line.length
    greatest_length = line.length
  end
end

line_width = greatest_length + 2

poem.each do |line|
  puts line.center(line_width)
end