#!/usr/bin/env ruby
# frozen_string_literal: true

# Orange Tree
class OrangeTree
  attr_reader :height, :age

  def initialize
    @age = 1
    @alive = true
    @height = 4
    @orange_count = 0
  end

  def one_year_passes
    @age += 1
    @height += 2 if @height < 30
    @alive = false if rand(1..100) < age
    unless @alive
      puts 'Your tree has gone to meet its maker.'
      exit
    end
    return unless @age > 6

    puts 'fruiting'
    @orange_count = rand(200..350)
  end

  def count_the_oranges
    @orange_count
  end

  def pick_an_orange
    unless @orange_count.positive?
      puts '  No oranges available to pick or eat.'
      return
    end
    @orange_count -= 1
    puts '  Picked and ate an orange from your tree. It was ' \
         "#{ %w[delicious! tasty OK dry].sample }."
  end
end

# Orange tree. Make an OrangeTree class that has a height method that returns
# its height and a one_year_passes method that, when called, ages the tree one
# year. Each year the tree grows taller (however much you think an orange
# tree should grow in a year), and after some number of years (again, your
# call) the tree should die. For the first few years, it should not produce
# fruit, but after a while it should, and I guess that older trees produce
# more each year than younger trees . . . whatever you think makes the most
# sense. And, of course, you should be able to count_the_oranges (which returns
# the number of oranges on the tree) and pick_an_orange (which reduces the
# @orange_count by 1 and returns a string telling you how delicious the orange
# was, or else it just tells you that there are no more oranges to pick this
# year). Make sure any oranges you don't pick one year fall off before the
# next year.

tree = OrangeTree.new
100.times do
  tree.one_year_passes
  puts "The tree is #{ tree.height } feet tall."
  puts "  Your tree has lived for #{ tree.age } years."
  puts "  This year it is bearing #{ tree.count_the_oranges } oranges."
  tree.pick_an_orange
  puts "    #{ tree.count_the_oranges } oranges remain on the tree."
end
