# frozen_string_literal: true

# Procs

def maybe_do(some_proc)
  some_proc.call if rand(2).zero?
end

def twice_do(some_proc)
  2.times { some_proc.call }
end

wink = proc { puts '<wink>' }
glance = proc { puts '<glance>' }

maybe_do wink
maybe_do wink
maybe_do glance
maybe_do glance
twice_do wink
twice_do glance
