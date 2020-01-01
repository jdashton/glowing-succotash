# frozen_string_literal: true

require 'spec_helper'
require 'advent13'
require 'tracer'

describe Advent13 do
  subject(:adv13) { described_class.new }

  before do
    consts = {
      'INSTRUCTIONS' =>
                        [
                          1, 0,
                          0, 0,
                          1, 0,
                          1, 0,
                          0, 1,
                          1, 0,
                          1, 0
                        ]
    }
    consts.each { |k, v| stub_const(k, v) }
  end
end
