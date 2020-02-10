# frozen_string_literal: true

def give
  yield('2 turtle doves', '1 partridge')
end

give do |present1, present2|
  puts 'My method gave to me...'
  puts present1, present2
end

def take_this
  yield 'present'
end

take_this do |thing|
  puts "do/end block got #{ thing }"
end

take_this { |thing| puts "braces block got #{ thing }" }

def my_method
  yield 1
  yield 2
  yield 3
end

my_method { |param| puts param }
