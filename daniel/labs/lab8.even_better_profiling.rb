# frozen_string_literal: true

# Rudimentary profiler

ENABLE_PROFILING = false

def profile(block_description)
  return yield unless ENABLE_PROFILING

  start_time = Time.new
  yield
  duration = Time.new - start_time
  puts "#{ block_description }: #{ duration } seconds"
end

profile '25,000 doublings' do
  number = 1

  25_000.times do
    number += number
  end

  puts "#{ number.to_s.length } digits"
end

profile 'count to a million' do
  number = 0
  1_000_000.times do
    number += 1
  end
end
