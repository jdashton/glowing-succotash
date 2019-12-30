# frozen_string_literal: true

require 'spec_helper'
require 'Advent11'
require 'tracer'

describe Advent11 do
  subject(:adv11) { described_class.new }

  before do
    consts = {
      'PRG1'  => [3, 9, 8, 9, 10, 9, 4, 9, 99, -1, 8]    
    }
    consts.each { |k, v| stub_const(k, v) }
  end

end
