# frozen_string_literal: true

# These are just to make the map easier for me to read.
# "M" is visually more dense than "o".
M = 'land'
o = 'water'
world = [[o, o, o, o, o, o, o, o, o, o, o],
         [o, o, o, o, M, M, o, o, o, o, o],
         [o, o, o, o, o, o, o, o, M, M, o],
         [o, o, o, M, o, o, o, o, o, M, o],
         [o, o, o, M, o, M, M, o, o, o, o],
         [o, o, o, o, M, M, M, M, o, o, o],
         [o, o, o, M, M, M, M, M, M, M, o],
         [o, o, o, M, M, o, M, M, M, o, o],
         [o, o, o, o, o, o, M, M, o, o, o],
         [o, M, o, o, o, M, o, o, o, o, o],
         [o, o, o, o, o, o, o, o, o, o, o]]
def continent_size(world, x, y)
  # Either it's water or we already counted it,
  # but either way, we don't want to count it now.
  return 0 if world.dig(y, x) != 'land'

  # So first we mark this tile as counted, ...
  world[y][x] = 'counted land'
  # ...then we count all of the neighboring eight tiles
  # (and, of course, their neighbors by way of the recursion).
  (-1..1)
    .to_a
    .repeated_permutation(2)
    .reject { |c| c.all?(&:zero?) }
    .reduce(1) { |acc, (dx, dy)| acc + continent_size(world, x + dx, y + dy) }
end

puts continent_size(world, 5, 5)
