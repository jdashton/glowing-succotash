# frozen_string_literal: true

require 'English'
require 'set'

# IntCode with + and * opcodes
class Advent09
  def self.val(idx, offset, modes, rbase, prg_ary)
    return prg_ary[idx + offset] if modes[offset] == 1

    prg_ary[pos(idx, offset, modes, rbase, prg_ary)] || 0
  end

  def self.pos(idx, offset, modes, rbase, prg_ary)
    prg_ary[idx + offset] + (modes[offset] == 2 ? rbase[0] : 0)
  end

  def self.calc(idx, modes, rbase, prg_ary, operation)
    val(idx, 1, modes, rbase, prg_ary)
      .send(operation, val(idx, 2, modes, rbase, prg_ary))
  end

  def self.calcb(idx, modes, rbase, prg_ary, operation)
    calc(idx, modes, rbase, prg_ary, operation) ? 1 : 0
  end

  def self.test_jump(idx, modes, rbase, prg_ary, test_op)
    if val(idx, 1, modes, rbase, prg_ary).send(test_op)
      val(idx, 2, modes, rbase, prg_ary)
    else
      idx + 3
    end
  end

  OPCODE_IMPLS = {
    1 => ->(p, i, m, r, *) { p[pos(i, 3, m, r, p)] = calc(i, m, r, p, :+) },
    2 => ->(p, i, m, r, *) { p[pos(i, 3, m, r, p)] = calc(i, m, r, p, :*) },
    3 => ->(p, i, m, r, inp, _) { p[pos(i, 1, m, r, p)] = inp.gets.to_i },
    4 => ->(p, i, m, r, _, out) { out.puts val(i, 1, m, r, p) },
    5 => ->(p, i, m, r, *) { test_jump(i, m, r, p, :nonzero?) },
    6 => ->(p, i, m, r, *) { test_jump(i, m, r, p, :zero?) },
    7 => ->(p, i, m, r, *) { p[pos(i, 3, m, r, p)] = calcb(i, m, r, p, :<) },
    8 => ->(p, i, m, r, *) { p[pos(i, 3, m, r, p)] = calcb(i, m, r, p, :==) },
    9 => ->(p, i, m, r, *) { r[0] += val(i, 1, m, r, p) }
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
    8 => 4,
    9 => 2
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
  end

  # Implement an IntCode computer
  def run(prg_ary, inp = STDIN, out = $DEFAULT_OUTPUT)
    idx = 0
    rbase = [0]
    # STDOUT.puts 'START'
    while OPCODES.include?(o = op(prg_ary[idx]))
      # STDOUT.puts o
      i = OPCODE_IMPLS[o]
            .call(prg_ary, idx, modes(prg_ary[idx]), rbase, inp, out)
      idx = JMP_OPS.include?(o) ? i : idx + OP_LENS[o]
    end
    # puts prg_ary[idx] == 99 ? "HALT" : "UNEXPECTED OPCODE #{ prg_ary[idx] }"
    prg_ary
  end

  def start_computers(prg_ary, pipes)
    threads = (pipes + [pipes[0]]).each_cons(2).map do |((inp, _), (_, outp))|
      Thread.new { run(prg_ary.dup, inp, outp) }
    end
    pipes[0][1] << "0\n"
    threads.each(&:join)
  end

  def run_one(prg_ary, phases, pipes = [])
    IO.pipe do |pread, pwrite|
      pipes.push [pread, pwrite]
      pwrite << "#{ phases.shift }\n"

      return run_one(prg_ary, phases, pipes) unless phases.empty?

      start_computers(prg_ary, pipes)
      pipes[0][0].gets.to_i
    end
  end

  # Run a program on a pipeline of five amplifiers, with 0 as the first input.
  def amplify(prg_ary, range = 0..4)
    partial = method(:run_one).curry.call(prg_ary)
    outputs = range.to_a.permutation.map(&partial)
    puts outputs.max
  end

  def amplify_feedback(prg_ary)
    amplify prg_ary, 5..9
  end
end
