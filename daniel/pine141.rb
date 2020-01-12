# frozen_string_literal: true

# Procs

def do_self_importantly(some_proc)
  puts "Everybody just HOLD ON!  I'm doing something...."
  some_proc.call
  puts "OK everyone, I'm done.  As you were."
end

say_hello = proc { puts 'hello' }

say_goodbye = proc { puts 'goodbye' }

do_self_importantly say_hello
do_self_importantly say_goodbye
