def trip_over_curb
  raise 'WHOA!'
end

begin
  trip_over_curb
rescue StandardError
  puts 'Caught you!'
end
