# frozen_string_literal: true

# IntCode with + and * opcodes
class Advent08
  WIDTH = 25
  HEIGHT = 6

  def fewest_zeros(input_str)
    input_digits = input_str.chomp.each_char.map(&:to_i)
    least_zeros =
      input_digits
        .each_slice(WIDTH * HEIGHT)
        .map do |slice_digits|
        slice_digits
          .each_with_object(Hash.new(0)) { |d, counts| counts[d] += 1 }
      end
        .min_by { |h| h[0] }
    least_zeros[1] * least_zeros[2]
  end

  def composite(image_data)
    image_data[0]
      .zip(*image_data[1..-1])
      .map do |pixel_digits|
        pixel_digits
          .reject { |d| d == 2 }[0]
      end
  end

  def process(input_str, width = WIDTH, height = HEIGHT)
    input_digits = input_str.chomp.each_char.map(&:to_i)
    layers =
      input_digits
        .each_slice(width * height)
        .reduce([]) { |a, o| a << o }
    composite(layers).join
  end
end
