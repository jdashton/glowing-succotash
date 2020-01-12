# frozen_string_literal: true

# Procs

def compose(proc1, proc2)
  proc { |x| proc2.call(proc1.call(x)) }
end

square_it = proc { |x| x * x }

double_it = proc { |x| x + x }

double_then_square = compose(double_it, square_it)
square_then_double = compose(square_it, double_it)

puts double_then_square.call(5)
puts square_then_double.call(5)
