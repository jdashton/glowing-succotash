# frozen_string_literal: true

require 'spec_helper'
require 'advent11'
require 'tracer'

describe Advent11 do
  subject(:adv11) { described_class.new(inpipe, outpipe) }

  let!(:inpipe) { IO.pipe }
  let!(:outpipe) { IO.pipe }

  before do
    consts = {
      'PRG1' => [3, 9, 8, 9, 10, 9, 4, 9, 99, -1, 8]
    }
    consts.each { |k, v| stub_const(k, v) }
  end

  it 'outputs 0 as its first action' do
    adv11.run
    expect(outpipe[0].gets).to eq("0\n")
  end
end
