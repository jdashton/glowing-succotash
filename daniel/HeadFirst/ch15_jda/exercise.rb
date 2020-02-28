require 'sinatra'

get('/form') do
  erb :form
end

post('/convert') do
  fahrenheit = params['temperature'].to_f
  celsius = (fahrenheit - 32) / 1.8
  format('%<f>0.1f degrees Fahrenheit is %<c>0.1f degrees Celsius.',
         f: fahrenheit,
         c: celsius)
end
