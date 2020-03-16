class AskMeAnything
  def method_missing(method_name, arg1, arg2)
    "You called #{ method_name } with #{ arg1 } and #{ arg2 }."
  end
end

object = AskMeAnything.new
# p object.this_method_is_not_defined
# p object.also_undefined
p object.with_args(127.6, 'hello')

class Politician
  def method_missing(method_name, argument)
    puts "I promise to #{ method_name } #{ argument }!"
  end
end

politician = Politician.new
politician.lower('taxes')
politician.improve('education')
