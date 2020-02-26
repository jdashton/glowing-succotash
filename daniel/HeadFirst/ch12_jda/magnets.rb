def drive(destination)
  raise "You can't drive to Hawaii!" if destination == 'Hawaii'
end

begin
  drive('Hawaii')
rescue StandardError => e
  puts e.message
end

# You can't drive to Hawaii!
