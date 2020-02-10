# frozen_string_literal: true

# rubocop:disable Metrics/MethodLength
def pig_latin(words)
  original_length = 0
  new_length = 0

  words.each do |word|
    puts "Original word: #{ word }"
    original_length += word.length
    letters = word.chars
    first_letter = letters.shift
    new_word = "#{ letters.join }#{ first_letter }ay"
    puts "Pig Latin word: #{ new_word }"
    new_length += new_word.length
  end

  puts "Total original length: #{ original_length }"
  puts "Total Pig Latin length: #{ new_length }"
end
# rubocop:enable Metrics/MethodLength

my_words = %w[blocks totally rock]
pig_latin(my_words)

# Pool Words
#
# yield
#
#
#
# shrink
#
# new
#
#
