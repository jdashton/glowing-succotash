# frozen_string_literal: true

# Produce complex fuel from raw ore
class Advent14
  RECIPE_PARSER = /(.*) => (\d+ \w+)/.freeze
  ITEM_PARSER = /(\d+) (\w+)/.freeze

  def initialize
    @surplus = Hash.new(0)
    @ore_consumed = 0
  end

  def parse_recipe(recipe)
    recipe.scan(RECIPE_PARSER)
      .map do |l|
      k = l.map { |s| s.scan(ITEM_PARSER).map { |(q, c)| [c.to_sym, q.to_i] } }
      [k[1][0][0], [k[1][0][1], k[0]]]
    end
  end

  def produce(product, qty)
    return @ore_consumed += qty if product == :ORE

    while @surplus[product] < qty
      batch_size, ingredients = @recipe_tree[product]
      ingredients.each { |i| produce(*i) }
      @surplus[product] += batch_size
    end
    @surplus[product] -= qty
  end

  def find_needs(recipe)
    @recipe_tree = Hash[parse_recipe(recipe)]
    raise 'Not in terms of 1 fuel' if @recipe_tree[:FUEL][0] != 1

    produce(:FUEL, 1)
    @ore_consumed
  end
end
