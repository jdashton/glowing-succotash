# frozen_string_literal: true

# rubocop:disable Metrics/MethodLength
def do_something_with_every_item(array, operation)
  amount = 0 if %i[total refund].include? operation
  index = 0
  while index < array.length
    case operation
    when :total then amount += array[index]
    when :refund then amount -= array[index]
    else
      amount_off = array[index] / 3.0
      puts format('Your discount: $%<discount>.2f', discount: amount_off)
    end
    index += 1
  end
  return amount if %i[total refund].include? operation
end
# rubocop:enable Metrics/MethodLength

prices = [3.99, 25.0, 8.99]

puts format('%<total>.2f', total: do_something_with_every_item(prices, :total))

puts format('%<refund>.2f',
            refund: do_something_with_every_item(prices, :refund))

do_something_with_every_item(prices, :show_discounts)
