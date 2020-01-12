# frozen_string_literal: true

def log(description)
  puts "Beginning \"#{ description }\"..."
  ret = yield
  puts "...\"#{ description }\" finished, returning:  #{ ret }"
  ret
end

log 'outer block' do
  log('some little block') { nil }
  puts 5
  log('yet another block') { nil }
  puts 'I like Thai food!'
  false
end
