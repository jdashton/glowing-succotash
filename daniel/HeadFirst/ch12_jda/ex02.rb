def send_sos
  raise 'Latitude -50.75, Longitude 166.04'
end

begin
  send_sos
rescue StandardError => e
  puts 'Sending rescue party to ' + e.message
end
