# frozen_string_literal: true

# Convert numbers to English words.
class Lab6EnglishNumber
  WORDS = [
    [nil, 'one', 'two', 'three',
     'four', 'five', 'six',
     'seven', 'eight', 'nine',
     'ten', 'eleven', 'twelve', 'thirteen',
     'fourteen', 'fifteen', 'sixteen',
     'seventeen', 'eighteen', 'ninetten'],
    [nil, nil, 'twenty', 'thirty',
     'forty', 'fifty', 'sixty',
     'seventy', 'eighty', 'ninety']
  ].freeze
  ILLIONS = [nil, 'thousand', 'million', 'billion', 'trillion'].freeze
  CONNECTORS = [nil, '-', ' ', ' '].freeze

  ONES = 0
  TENS = 1
  HUNDREDS = 2
  THOUSANDS = 3
  POWERS = [THOUSANDS, HUNDREDS, TENS, ONES].freeze

  def split_number(remainder, power)
    quotient, remainder = remainder.divmod(10**power)

    # If this number is a teen, handle it like ONES.
    if power == TENS && quotient == 1
      quotient = 0
      remainder += 10
    end
    [quotient, remainder]
  end

  def format(quotient, remainder, power, depth)
    if [ONES, TENS].include?(power)
      WORDS[power][quotient]
    elsif power == HUNDREDS
      convert(quotient) + ' hundred'
    else
      convert(quotient, depth + 1)
    end + (remainder.positive? ? CONNECTORS[power] : '')
  end

  def add_illions(depth, skip_illions)
    if skip_illions || ILLIONS[depth].nil?
      ''
    else
      ' ' + ILLIONS[depth]
    end
  end

  def convert(remainder, depth = 0)
    return 'Please enter a non-negative number.' if remainder.negative?
    return 'zero' if remainder.zero?

    skip_illions = false
    # THOUSANDS, HUNDREDS, TENS, or ONES
    POWERS.reduce('') do |acc, power|
      quotient, remainder = split_number(remainder, power)
      next acc unless quotient.positive?

      skip_illions = true if power == THOUSANDS && remainder.zero?
      acc + format(quotient, remainder, power, depth)
    end + add_illions(depth, skip_illions)
  end
end
