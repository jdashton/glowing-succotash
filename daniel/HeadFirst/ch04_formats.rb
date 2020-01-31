# frozen_string_literal: true

def test_format(format_string)
  print "Testing '#{ format_string }': "
  puts format(format_string, 12.3456)
end

test_format '%7.3f'
test_format '%7.2f'
test_format '%7.1f'
test_format '%.1f'
test_format '%.2f'

puts format('$%<sal1>.2f', sal1: 2514.2727367874069)
puts format('$%<sal2>.2f', sal2: 1150.6849315068494)
puts format('$%<sal3>.2f', sal3: 3068.4931506849316)
