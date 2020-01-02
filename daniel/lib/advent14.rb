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

  def produce(product, qty_rqstd, factor = 1)
    qty_rqstd *= factor
    return @ore_consumed += qty_rqstd if product == :ORE

    batch_size, ingredients = @recipe_tree[product]
    num_batches = ((qty_rqstd - @surplus[product]) / batch_size.to_f).ceil
    ingredients.each { |i| produce(*i, num_batches) }
    @surplus[product] += batch_size * num_batches - qty_rqstd
  end

  def find_needs(recipe)
    @recipe_tree = Hash[parse_recipe(recipe)]
    raise 'Not in terms of 1 fuel' if @recipe_tree[:FUEL][0] != 1

    produce(:FUEL, 1)
    @ore_consumed
  end

  TRILLION = 1_000_000_000_000

  def how_much(recipe)
    @recipe_tree = Hash[parse_recipe(recipe)]
    produce(:FUEL, TRILLION)
    actual_per_unit = @ore_consumed / TRILLION.to_f
    (TRILLION / actual_per_unit).floor
  end
end
