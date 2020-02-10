# frozen_string_literal: true

def total(prices)
  prices.reduce(0) { |amount, price| amount + price }
end

prices = [3.99, 25.0, 8.99]

puts format('%<total>.2f', total: total(prices))

def refund(prices)
  prices.reduce(0) { |amount, price| amount - price }
end

puts format('%<refund>.2f', refund: refund(prices))

DISC_STR = 'Your discount: $%<discount>.2f'

def show_discounts(prices)
  prices.each { |price| puts format(DISC_STR, discount: price / 3.0) }
end

show_discounts(prices)
