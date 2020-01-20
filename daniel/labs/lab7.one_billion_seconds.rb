# frozen_string_literal: true

my_birthday = Time.local(1967, 9, 24)

puts('I reached the age of one billion seconds around ' \
     "#{ (my_birthday + 1_000_000_000).strftime('%B %-e, %Y') }")
