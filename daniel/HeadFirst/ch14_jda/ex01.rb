require 'sinatra'

def roll_die(sides)
  "Rolling #{ sides } sided die: #{ rand(sides) + 1 }"
end

get('/roll/4') do
  roll_die(4)
end

get('/roll/6') do
  roll_die(6)
end

get('/roll/20') do
  roll_die(20)
end
