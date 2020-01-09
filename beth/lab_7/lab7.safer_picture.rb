# frozen_string_literal: true

CATEGORIES = %w[
  bark
  leaves
  moss
].freeze

def generate_name(old_name, file_type, batch_name, tally)
  print "#{ old_name }: "
  old_down = old_name.downcase

  CATEGORIES.each do |cat|
    next unless old_down.include?(cat)

    extra = old_down.include?('seamless') ? '_seamless' : ''

    num = (tally[cat] += 1)
    puts "adding to category: #{ cat } ##{ num }"
    return "#{ cat }/#{ cat }#{ num }#{ extra }.#{ file_type }"
  end

  num = (tally[:default_category] += 1)
  puts "no category found. Default Number assigned: ##{ num }"
  "#{ batch_name }#{ num }.#{ file_type }"
end

Dir.chdir 'inputs/new_pictures'

pic_names_jpgs = Dir['../pictures/*.jpg']
pic_names_pngs = Dir['../pictures/*.png']

print 'What would you like to call this batch? '

batch_name = gets.chomp

puts
puts "Moving #{ pic_names_jpgs.length + pic_names_pngs.length } files:  "

category_tally = Hash.new(0)

{
  'jpg' => pic_names_jpgs,
  'png' => pic_names_pngs
}.each do |extension, list|
  list.each do |name|
    File.rename name, generate_name(name, extension, batch_name, category_tally)
  end
end

puts
puts 'Done!'
