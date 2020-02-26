# Imperfect porridge
class PorridgeError < StandardError
end

# Imperfect bed
class BeddingError < StandardError
end

def eat
  raise PorridgeError, 'too hot'
end

def sleep
  raise BeddingError, 'too soft'
end

begin
  sleep
rescue BeddingError => e
  puts "This bed is #{ e.message }!"
rescue PorridgeError => e
  puts "This porridge is #{ e.message }!"
end
