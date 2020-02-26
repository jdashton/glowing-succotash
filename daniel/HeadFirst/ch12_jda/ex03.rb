class ThisError < StandardError; end
class ThatError < StandardError; end
class TheOtherError < StandardError; end

def random_failure
  number = rand(0..2)
  case number
  when 0 then raise(ThisError, 'Whoops!')
  when 1 then raise(ThatError, 'Uh, oh!')
  when 2 then raise(TheOtherError, 'Oh, no!')
  end
end

begin
  random_failure
rescue ThisError
  puts '“I caught this!”'
rescue ThatError
  puts '“I caught that!”'
end
