# frozen_string_literal: true

require 'set'

# Look around an asteriod map, and blast the laser
class Advent10
  def initialize
    @looks = {}
  end

  def look_around(sector_x, sector_y)
    roids = Hash.new { |h, k| h[k] = [] }
    @input_map.each_with_index do |row, y|
      row.each_with_index do |col, x|
        next unless col == '#'
        next if x == sector_x && y == sector_y

        angle = Math.atan2(x - sector_x, y - sector_y)
        roids[angle] << [x, y]
      end
    end
    roids
  end

  def transform(input_map)
    @input_map = input_map
    input_map.map.with_index do |input_row, y|
      input_row.map.with_index do |sector, x|
        sector == '.' ? 0 : (@looks[[x, y]] = look_around(x, y)).size
      end
    end
  end

  def search_map(input_map)
    output_map = transform input_map
    best_num = output_map.flatten.max
    output_map.each_with_index do |row, row_idx|
      row.each_with_index do |col, col_idx|
        return [[col_idx, row_idx], best_num] if col == best_num
      end
    end
  end

  def parse_map(input_text)
    input_map = input_text.split.map(&:chars)
    search_map input_map
  end

  def offset(atd_x, atd_y)
    (atd_x - @coords[0]).abs + (atd_y - @coords[1]).abs
  end

  def sort_roids
    @optimal_map.each_value do |v|
      v.sort! { |a, b| offset(*a) <=> offset(*b) }
    end
  end

  def shoot(angle)
    asteroid = @optimal_map[angle].shift
    @optimal_map.delete(angle) if @optimal_map[angle].empty?
    asteroid
  end

  def shoot_roids(input_text)
    @coords, = parse_map input_text
    @optimal_map = @looks[@coords]
    sort_roids
    dest_order = []
    dest_order += @optimal_map
                    .keys
                    .sort
                    .reverse
                    .map { |k| shoot(k) } until @optimal_map.empty?
    dest_order
  end
end
