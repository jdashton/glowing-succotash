# frozen_string_literal: true

# IntCode with + and * opcodes
class Advent02
  def self.val(program, index, offset)
    program[program[index + offset]]
  end

  def self.calc(p, i, op)
    val(p, i, 1).send(op, val(p, i, 2))
  end

  IMPLEMENTATIONS = {
    1 => ->(p, i) { p[p[i + 3]] = calc(p, i, :+) },
    2 => ->(p, i) { p[p[i + 3]] = calc(p, i, :*) },
    5 => ->(p, i) { val(p, i, 1).nonzero? ? val(p, i, 2) : i + 3 }
  }.freeze

  KNOWN_OPCODES = IMPLEMENTATIONS.keys.freeze # [1, 2]

  LENGTHS = {
    1 => 4,
    2 => 4
  }.freeze

  JUMP_OPS = [5, 6].freeze

  def run(prg_ary)
    ip = 0
    while KNOWN_OPCODES.include?(opcode = prg_ary[ip])
      new_ip = IMPLEMENTATIONS[opcode].call(prg_ary, ip)
      ip = JUMP_OPS.include?(opcode) ? new_ip : ip + LENGTHS[opcode]
    end
    prg_ary
  end
end

# input = [1, 0, 0, 3, 1, 1, 2, 3, 1, 3, 4, 3, 1, 5, 0, 3, 2, 1, 10, 19, 1, 6, 19,
#          23, 2, 23, 6, 27, 2, 6, 27, 31, 2, 13, 31, 35, 1, 10, 35, 39, 2, 39,
#          13, 43, 1, 43, 13, 47, 1, 6, 47, 51, 1, 10, 51, 55, 2, 55, 6, 59, 1, 5,
#          59, 63, 2, 9, 63, 67, 1, 6, 67, 71, 2, 9, 71, 75, 1, 6, 75, 79, 2, 79,
#          13, 83, 1, 83, 10, 87, 1, 13, 87, 91, 1, 91, 10, 95, 2, 9, 95, 99, 1,
#          5, 99, 103, 2, 10, 103, 107, 1, 107, 2, 111, 1, 111, 5, 0, 99, 2, 14,
#          0, 0]

# adv2 = Advent2.new
# input[1] = 12
# input[2] = 2
# output = adv2.run([].replace(input))
# puts output[0]

# # Look for the input that produces 19690720 in [0]
# (0..99).each do |noun|
#   (0..99).each do |verb|
#     new_code = [].replace(input)
#     new_code[1] = noun
#     new_code[2] = verb
#     output = adv2.run(new_code)
#     puts noun * 100 + verb if output[0] == 19_690_720
#   end
# end
