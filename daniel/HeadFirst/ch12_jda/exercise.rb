# Insufficient knowledge
class TestScoreError < StandardError
end

score = 52
begin
  raise TestScoreError, 'failing grade' unless score > 60

  puts 'passing grade'
rescue TestScoreError => e
  puts "Received #{ e.message }. Taking make-up exam..."
  score = 63
  retry
end
