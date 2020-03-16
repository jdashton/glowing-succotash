puts 'Found phone number.' if 'Tel: 555-0199'.match?(/555-0199/)

puts 'Found phone number.' if 'Tel: 555-0199'.match?(/\d\d\d-\d\d\d\d/)

puts 'Found phone number.' if 'Tel: 555-0199'.match?(/\d+-\d+/)

puts 'Found phone number.' if 'Tel: 555-0199'.match?(/\d{3}-\d{4}/)

if 'Tel: 555-0199' =~ /(\d{3}-\d{4})/
  puts "Found phone number: #{ Regexp.last_match(1) }"
end

puts 'Tel: 555-0148'.sub(/\d{3}-\d{4}/, '***-****')
