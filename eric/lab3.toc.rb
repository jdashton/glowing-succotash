puts "Table of Contents".center(50)
table = [ 
  ["1" , "Getting Started" , "1"] , 
  ["2" , "Numbers" , "9"] ,  
  [ "3" , "Letters" , "13"]
]
# Need to use the array to fill in table of contents
table.each do |ch|
  puts "Chapter #{ch[0]}:  #{ch[1].ljust(47)}  page #{ch[2].rjust(2)}"    
end