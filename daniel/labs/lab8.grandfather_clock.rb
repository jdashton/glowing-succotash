# frozen_string_literal: true

# Grandfather clock
def grandfather_hours
  case hours = Time.now.hour
  when 0 then 12
  when 1..12 then hours
  else hours - 12
  end.times { yield }
end

grandfather_hours { puts 'DONG!' }
