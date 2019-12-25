# frozen_string_literal: true

require 'set'

# Look around an asteriod map, and blast the laser
class Advent10
  def transform(input_map)
    @input_map = input_map
    input_map.map.with_index do |input_row, row_idx|
      input_row.map.with_index do |sector, col_idx|
        sector == '.' ? 0 : look_around(col_idx, row_idx)
      end
    end
  end

  def look_around(sector_x, sector_y)
    roids = Set.new
    @input_map.each_with_index do |row, row_idx|
      row.each_with_index do |col, col_idx|
        next unless col == '#'
        next if col_idx == sector_x && row_idx == sector_y

        roids << Math.atan2(col_idx - sector_x, row_idx - sector_y)
      end
    end
    roids.size
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
    input_map = input_text.split.map { |line| line.split('') }
    search_map input_map
  end
end
