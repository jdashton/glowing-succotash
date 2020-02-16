class Counter
  def initialize
    @count = 0
  end

  def increment
    @count += 1
    puts @count
  end
end

a = Counter.new
b = Counter.new
c = b
d = c

a.increment
b.increment
c.increment
d.increment
