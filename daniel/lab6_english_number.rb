# frozen_string_literal: true

# Convert numbers to English words.
class Lab6EnglishNumber
  WORDS = [
    ['', 'one', 'two', 'three',
     'four', 'five', 'six',
     'seven', 'eight', 'nine',
     'ten', 'eleven', 'twelve', 'thirteen',
     'fourteen', 'fifteen', 'sixteen',
     'seventeen', 'eighteen', 'ninetten'],
    ['', '', 'twenty', 'thirty',
     'forty', 'fifty', 'sixty',
     'seventy', 'eighty', 'ninety']
  ].freeze
  ILLIONS = ['', ' thousand', ' million', ' billion', ' trillion'].freeze
  LABELS = ['', '', ' hundred', ''].freeze
  CONNECTORS = ['', '-', ' ', ' '].freeze

  ONES = 0
  TENS = 1
  HUNDREDS = 2
  THOUSANDS = 3
  POWERS = [THOUSANDS, HUNDREDS, TENS, ONES].freeze

  def split_number(remainder, power)
    quotient, remainder = remainder.divmod(10**power)
    if power == TENS && quotient == 1
      quotient = 0
      remainder += 10
    end
    [quotient, remainder]
  end

  def format(quotient, remainder, power, depth)
    (if [HUNDREDS, THOUSANDS].include?(power)
       convert(quotient, power == THOUSANDS ? depth + 1 : 0) + LABELS[power]
     else
       WORDS[power][quotient]
     end) + (remainder.positive? ? CONNECTORS[power] : '')
  end

  def convert(remainder, depth = 0)
    return 'Please enter a non-negative number.' if remainder.negative?
    return 'zero' if remainder.zero?

    num_string = ''
    POWERS.each do |power| # THOUSANDS, HUNDREDS, TENS, or ONES
      quotient, remainder = split_number(remainder, power)
      next unless quotient.positive?

      num_string += format(quotient, remainder, power, depth)
      return num_string if power == THOUSANDS && remainder.zero?
    end
    num_string + ILLIONS[depth]
  end
end
