# Shuffle. Now that you've finished your new sorting algorithm, how about
# the opposite? Write a shuffle method that takes an array and returns a totally
# shuffled version. As always, you'll want to test it, but testing this
# one is trickier: How can you test to make sure you are getting a perfect
# shuffle? What would you even say a perfect shuffle would be? Now test
# for it.

def shuffle(ary)
  return [] if ary.empty?

  a = ary.dup
  some_item = a.delete_at(rand(a.length))
  [some_item] + shuffle(a)
end

if $PROGRAM_NAME == __FILE__
  initial_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  pp shuffle(initial_array)
  pp initial_array
end
