# frozen_string_literal: true

require 'spec_helper'
require 'advent07'

describe Advent07 do
  subject(:adv07) { described_class.new }

  before do
    prgs = {
      'PRG1'  => [3, 9, 8, 9, 10, 9, 4, 9, 99, -1, 8],
      'PRG2'  => [3, 9, 7, 9, 10, 9, 4, 9, 99, -1, 8],
      'PRG3'  => [3, 3, 1108, -1, 8, 3, 4, 3, 99],
      'PRG4'  => [3, 3, 1107, -1, 8, 3, 4, 3, 99],
      'PRG5'  => [3, 12, 6, 12, 15, 1, 13, 14, 13, 4, 13, 99, -1, 0, 1, 9],
      'PRG6'  => [3, 3, 1105, -1, 9, 1101, 0, 0, 12, 4, 12, 99, 1],
      'PRG7'  => [
        3, 21, 1008, 21, 8, 20, 1005, 20, 22, 107, 8, 21, 20, 1006, 20, 31,
        1106, 0, 36, 98, 0, 0, 1002, 21, 125, 20, 4, 20, 1105, 1, 46, 104,
        999, 1105, 1, 46, 1101, 1000, 1, 20, 4, 20, 1105, 1, 46, 98, 99
      ],
      'PRG8'  => [
        3, 15, 3, 16, 1002, 16, 10, 16, 1, 16, 15, 15, 4, 15, 99, 0, 0
      ],
      'PRG9'  => [
        3, 23, 3, 24, 1002, 24, 10, 24, 1002, 23, -1, 23,
        101, 5, 23, 23, 1, 24, 23, 23, 4, 23, 99, 0, 0
      ],
      'PRG10' => [
        3, 31, 3, 32, 1002, 32, 10, 32, 1001, 31, -2, 31, 1007, 31, 0, 33,
        1002, 33, 7, 33, 1, 33, 31, 31, 1, 32, 31, 31, 4, 31, 99, 0, 0, 0
      ]
    }
    prgs.each { |k, v| stub_const(k, v) }
  end

  # 1,0,0,0,99 becomes 2,0,0,0,99 (1 + 1 = 2).
  it 'transforms sample 1 as expected' do
    expect(adv07.run([1, 0, 0, 0, 99]))
      .to eq([2, 0, 0, 0, 99])
  end

  # 2,3,0,3,99 becomes 2,3,0,6,99 (3 * 2 = 6).
  it 'transforms sample 2 as expected' do
    expect(adv07.run([2, 3, 0, 3, 99]))
      .to eq([2, 3, 0, 6, 99])
  end

  # 2,4,4,5,99,0 becomes 2,4,4,5,99,9801 (99 * 99 = 9801).
  it 'transforms sample 3 as expected' do
    expect(adv07.run([2, 4, 4, 5, 99, 0]))
      .to eq([2, 4, 4, 5, 99, 9801])
  end

  # 1,1,1,4,99,5,6,0,99 becomes 30,1,1,4,2,5,6,0,99.
  it 'transforms sample 4 as expected' do
    expect(adv07.run([1, 1, 1, 4, 99, 5, 6, 0, 99]))
      .to eq([30, 1, 1, 4, 2, 5, 6, 0, 99])
  end

  it 'transforms sample 0 as expected' do
    expect(adv07.run([1, 9, 10, 3, 2, 3, 11, 0, 99, 30, 40, 50]))
      .to eq([3500, 9, 10, 70, 2, 3, 11, 0, 99, 30, 40, 50])
  end

  it 'handles opcode 3' do
    input = StringIO.new("42\n")
    expect(adv07.run([3, 3, 99, 0], input)).to eq([3, 3, 99, 42])
  end

  it 'handles opcode 4' do
    expect { adv07.run([4, 3, 99, 42]) }.to output("42\n").to_stdout
  end

  it 'handles immediate parameters' do
    expect(adv07.run([1002, 4, 3, 4, 33]))
      .to eq([1002, 4, 3, 4, 99])
  end

  it 'handles negative numbers' do
    expect(adv07.run([1101, 100, -1, 4, 0]))
      .to eq([1101, 100, -1, 4, 99])
  end

  it 'detects input == 8 using position mode' do
    input = StringIO.new("8\n")
    expect { adv07.run(PRG1.dup, input) }.to output("1\n").to_stdout
  end

  it 'detects input != 8 using position mode' do
    input = StringIO.new("42\n")
    expect { adv07.run(PRG1.dup, input) }.to output("0\n").to_stdout
  end

  it 'detects input < 8 using position mode' do
    input = StringIO.new("7\n")
    expect { adv07.run(PRG2.dup, input) }.to output("1\n").to_stdout
  end

  it 'detects input !< (==) 8 using position mode' do
    input = StringIO.new("8\n")
    expect { adv07.run(PRG2.dup, input) }.to output("0\n").to_stdout
  end

  it 'detects input !< (>) 8 using position mode' do
    input = StringIO.new("9\n")
    expect { adv07.run(PRG2.dup, input) }.to output("0\n").to_stdout
  end

  it 'detects input == 8 using immediate mode' do
    input = StringIO.new("8\n")
    expect { adv07.run(PRG3.dup, input) }.to output("1\n").to_stdout
  end

  it 'detects input != 8 using immediate mode' do
    input = StringIO.new("42\n")
    expect { adv07.run(PRG3.dup, input) }.to output("0\n").to_stdout
  end

  it 'detects input < 8 using immediate mode' do
    input = StringIO.new("7\n")
    expect { adv07.run(PRG4.dup, input) }.to output("1\n").to_stdout
  end

  it 'detects input !< (==) 8 using immediate mode' do
    input = StringIO.new("8\n")
    expect { adv07.run(PRG4.dup, input) }.to output("0\n").to_stdout
  end

  it 'detects input !< (>) 8 using immediate mode' do
    input = StringIO.new("9\n")
    expect { adv07.run(PRG4.dup, input) }.to output("0\n").to_stdout
  end

  it 'detects zero using jump with position mode' do
    input = StringIO.new("0\n")
    expect { adv07.run(PRG5.dup, input) }.to output("0\n").to_stdout
  end

  it 'detects non-zero using jump with position mode' do
    input = StringIO.new("1\n")
    expect { adv07.run(PRG5.dup, input) }.to output("1\n").to_stdout
  end

  it 'detects zero using jump with immediate mode' do
    input = StringIO.new("0\n")
    expect { adv07.run(PRG6.dup, input) }.to output("0\n").to_stdout
  end

  it 'detects non-zero using jump with immediate mode' do
    input = StringIO.new("1\n")
    expect { adv07.run(PRG6.dup, input) }.to output("1\n").to_stdout
  end

  it 'prints 999 for input < 8' do
    input = StringIO.new("7\n")
    expect { adv07.run(PRG7.dup, input) }.to output("999\n").to_stdout
  end

  it 'prints 1000 for input == 8' do
    input = StringIO.new("8\n")
    expect { adv07.run(PRG7.dup, input) }.to output("1000\n").to_stdout
  end

  it 'prints 1001 for input > 8' do
    input = StringIO.new("9\n")
    expect { adv07.run(PRG7.dup, input) }.to output("1001\n").to_stdout
  end

  it 'finds max signal 43210 for Day 7 Pt 1 example 1' do
    expect { adv07.amplify(PRG8.dup) }.to output("43210\n").to_stdout
  end

  it 'finds max signal 54321 for Day 7 Pt 1 example 2' do
    expect { adv07.amplify(PRG9.dup) }.to output("54321\n").to_stdout
  end

  it 'finds max signal 65210 for Day 7 Pt 1 example 3' do
    expect { adv07.amplify(PRG10.dup) }.to output("65210\n").to_stdout
  end
end
