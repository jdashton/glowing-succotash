require 'sinatra'

def roll_die(sides)
  "Rolling #{ sides } sided die: #{ rand(sides) + 1 }"
end

get('/roll/:sides') do
  roll_die(params['sides'].to_i)
end
