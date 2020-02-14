# frozen_string_literal: true

lines = File.read('votes.txt').lines.map(&:chomp).map(&:upcase)

votes = lines.reduce(Hash.new(0)) do |vs, line|
  vs.merge(line => vs[line] + 1)
end

votes.each do |name, count|
  puts "#{ name }: #{ count }"
end
