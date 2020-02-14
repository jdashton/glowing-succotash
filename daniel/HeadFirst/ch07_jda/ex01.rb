# frozen_string_literal: true

MONTH_NAMES =
  (1..12)
    .map { |m| format('%<mn>02d', mn: m) }
    .zip(
      %w[January February March April May June
         July August September October November December]
    )
    .to_h
    .freeze

def month_names
  MONTH_NAMES
end

def english_date(iso_date)
  year, month, day = iso_date.split('-')
  "#{ month_names[month] } #{ day }, #{ year }"
end

puts english_date('2002-06-20')
puts english_date('1974-12-13')
