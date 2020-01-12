# frozen_string_literal: true

# Procs
do_you_like = proc do |good_stuff|
  puts "I *really* like #{ good_stuff }!"
end

do_you_like.call 'chocolate'
do_you_like.call 'Ruby'
