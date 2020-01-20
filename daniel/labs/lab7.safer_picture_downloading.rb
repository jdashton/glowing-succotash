# frozen_string_literal: true

def new_name(batch_name, pic_number)
  if pic_number < 10
    "#{ batch_name }0#{ pic_number }.jpg"
  else
    "#{ batch_name }#{ pic_number }.jpg"
  end
end

# Change working directory to the target of this copy operation.
Dir.chdir 'copy_target'

# First we find all of the pictures to be moved.
pic_names = Dir['../copy_source/**/*.jpg']

print 'What would you like to call this batch? '
batch_name = gets.chomp

puts
puts 'Checking for existing files with that name . . .'
pic_names.each_index do |index|
  next unless File.exist?(new_name(batch_name, index + 1))

  puts "  This batch_name (#{ batch_name }) includes a file that already" \
       " exists in the target directory (#{ File.realdirpath('.') })"
  exit 1
end

puts
print "Moving #{ pic_names.length } files: "

# This will be our counter. We'll start at 1 today,
# though normally I like to count from 0.
pic_number = 1
pic_names.each do |name|
  print '.' # This is our "progress bar".
  File.rename name, new_name(batch_name, pic_number)

  # Finally, we increment the counter.
  pic_number += 1
end

puts # This is so we aren't on progress bar line.
puts 'Done, class!'
