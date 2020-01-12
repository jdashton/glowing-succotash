# frozen_string_literal: true

$nesting_depth = 0

def log(description)
  puts "#{ ' ' * $nesting_depth * 2 }Beginning \"#{ description }\"..."
  $nesting_depth += 1
  ret = yield
  $nesting_depth -= 1
  puts "#{ ' ' * $nesting_depth * 2 }...\"#{ description }\" finished, " \
       "returning:  #{ ret }"
  ret
end

log 'outer block' do
  log('some little block') do
    log('teeny-tiny block') { nil }
    puts '    lots of love'
  end
  puts '  42'
  log('yet another block') { nil }
  puts 'I love Indian food!'
end
puts true
