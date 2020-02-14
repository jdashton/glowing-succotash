# frozen_string_literal: true

# The Utils module
module Utils
  def self.volume(options)
    options[:width] * options[:height] * options[:depth]
  end
end

result = Utils.volume(height: 5, width: 10, depth: 2.5)

puts "Volume is #{ result }"

# Volume is 125.0
