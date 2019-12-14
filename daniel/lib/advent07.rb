# frozen_string_literal: true

require 'English'

# IntCode with + and * opcodes
class Advent07
  def self.val(idx, offset, modes, prg_ary)
    v = prg_ary[idx + offset]
    modes[offset] ? v : prg_ary[v]
  end

  def self.calc(idx, modes, prg_ary, operation)
    val(idx, 1, modes, prg_ary)
      .send(operation, val(idx, 2, modes, prg_ary))
  end

  def self.test_jump(idx, modes, prg_ary, test_op)
    if val(idx, 1, modes, prg_ary).send(test_op)
      val(idx, 2, modes, prg_ary)
    else
      idx + 3
    end
  end

  OPCODE_IMPLS = {
    1 => ->(p, i, m, _, _) { p[p[i + 3]] = calc(i, m, p, :+) },
    2 => ->(p, i, m, _, _) { p[p[i + 3]] = calc(i, m, p, :*) },
    3 => ->(p, i, _, inp, _) { p[p[i + 1]] = inp.gets.to_i },
    4 => ->(p, i, m, _, out) { out.puts val(i, 1, m, p) },
    5 => ->(p, i, m, _, _) { test_jump(i, m, p, :nonzero?) },
    6 => ->(p, i, m, _, _) { test_jump(i, m, p, :zero?) },
    7 => ->(p, i, m, _, _) { p[p[i + 3]] = calc(i, m, p, :<) ? 1 : 0 },
    8 => ->(p, i, m, _, _) { p[p[i + 3]] = calc(i, m, p, :==) ? 1 : 0 }
  }.freeze

  OPCODES = OPCODE_IMPLS.keys

  OP_LENS = {
    1 => 4,
    2 => 4,
    3 => 2,
    4 => 2,
    5 => 3,
    6 => 3,
    7 => 4,
    8 => 4
  }.freeze

  JMP_OPS = [5, 6].freeze

  def op(opcode)
    opcode.to_s.rjust(2, ?0)[-2..-1].to_i
  end

  def modes(opcode)
    opcode
      .to_s
      .rjust(OP_LENS[op(opcode)] + 1, ?0)[0..-2]
      .chars
      .reverse
      .map(&:to_i)
      .map { |i| i.positive? ? i : false }
  end

  # Implement an IntCode computer
  def run(prg_ary, inp = STDIN, out = $DEFAULT_OUTPUT)
    idx = 0
    while OPCODES.include?(o = op(prg_ary[idx]))
      i = OPCODE_IMPLS[o].call(prg_ary, idx, modes(prg_ary[idx]), inp, out)
      idx = JMP_OPS.include?(o) ? i : idx + OP_LENS[o]
    end
    # puts prg_ary[idx] == 99 ? "HALT" : "UNEXPECTED OPCODE #{ prg_ary[idx] }"
    prg_ary
  end

  def run_stack(prg_ary, phases)
    inp_sig = 0
    phases.each do |phase|
      inp = StringIO.new("#{ phase }\n#{ inp_sig }\n")
      out = StringIO.new
      run(prg_ary.dup, inp, out)
      out.rewind
      inp_sig = out.gets.to_i
    end
    inp_sig
  end

  # Run a program on a pipeline of five amplifiers, with 0 as the first input.
  def amplify(prg_ary)
    outputs = []
    (0..4).to_a.permutation.each do |list|
      outputs.push run_stack(prg_ary, list)
    end
    $DEFAULT_OUTPUT.puts outputs.max
  end
end
