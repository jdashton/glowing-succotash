line1 =                 'Old Mother Hubbard'
line2 =                'Sat in her cupboard'
line3 =         'Eating her curds and whey,'
line4 =           'When along came a spider'
line5 =            'Who sat down beside her'
line6 = 'And sacred her poor shoe dog away. yo'

# calc each in poem 
greatest_length = 0
if greatest_length < line1.length
  greatest_length = line1.length
end
if greatest_length < line2.length
  greatest_length = line2.length
end
if greatest_length < line3.length
  greatest_length = line3.length
end
if greatest_length < line4.length
  greatest_length = line4.length
end
if greatest_length < line5.length
  greatest_length = line5.length
end
if greatest_length < line6.length
  greatest_length = line6.length
end
line_width = greatest_length + 2
puts line1.center(line_width)
puts line2.center(line_width)
puts line3.center(line_width)
puts line4.center(line_width)
puts line5.center(line_width)
puts line6.center(line_width)