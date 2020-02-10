# frozen_string_literal: true

def print_block_result
  block_result = yield
  puts block_result
end

print_block_result { 1 + 1 }

print_block_result do
  # rubocop:disable Lint/Void
  'I\'m not the last expression, so I\'m not the return value.'
  # rubocop:enable Lint/Void
  'I\'m the result!'
end

print_block_result { 'I hate Truncated'.include?('Truncated') }

def triple_block_result
  puts 3 * yield
end

triple_block_result { 2 }
triple_block_result { 5 }

def greet
  puts "Hello, #{ yield }!"
end

greet { 'Liz' }

def alert_if_true
  if yield
    puts 'Block returned true!'
  else
    puts 'Block returned false.'
  end
end

alert_if_true { 2 + 2 == 5 }
alert_if_true { 2 > 1 }

def print_block_value
  puts yield
end

def other_method
  print_block_value { 1 + 1 }
end

other_method

def one_two
  result = yield(1, 2)
  puts result
end

one_two do |param1, param2|
  param1 + param2
end
