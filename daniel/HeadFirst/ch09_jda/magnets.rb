module Curious
  def investigate(thing)
    puts "Looks at #{ thing }"
  end
end

module Clumsy
  def break(thing)
    puts "Knocks over #{ thing }"
  end
end

class Monkey
  include Curious
  include Clumsy
end

bubbles = Monkey.new

bubbles.investigate('vase')
bubbles.break('vase')

# Output
# Looks at vase
# Knocks over vase
