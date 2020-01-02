# frozen_string_literal: true

# Produce complex fuel from raw ore
class Advent14
  PRODUCES_PARSER = /(.*) => (\d+ \w+)/.freeze
  ITEM_PARSER = /(\d+) (\w+)/.freeze

  def parse_recipe(recipe)
    Hash[recipe.scan(PRODUCES_PARSER)
           .map do |m|
           product = m[1].scan(ITEM_PARSER)[0]
           fuel_list = m[0].scan(ITEM_PARSER).map do |(q, c)|
             [c.to_sym, q.to_i]
           end
           [product[1].to_sym, [product[0].to_i, fuel_list]]
         end]
  end

  def find_needs(recipe)
    recipe_tree = parse_recipe(recipe)
    p recipe_tree
    31
  end
end
