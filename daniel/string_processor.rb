# frozen_string_literal: true

# Generic State Machine
class StateMachine
  def initialize(transitions, initial_state)
    @transitions = transitions
    @state = initial_state
  end

  def process
    @state, action = @transitions[@state][receive_event] ||
                     @transitions[@state][:default]
    send(action)
  end
end

TRANSITIONS = {
  # current new state action to take
  #---------------------------------------------------------
  look_for_string: {
    '"'   => %i[in_string start_new_string],
    default: %i[look_for_string ignore]
  },
        in_string: {
          '"'   => %i[look_for_string finish_current_string],
          '\\'  => %i[copy_next_char add_current_to_string],
          default: %i[in_string add_current_to_string]
        },
   copy_next_char: {
     default: %i[in_string add_current_to_string]
   }
}.freeze

# A StateMachine that parses strings
class StringParser < StateMachine
  attr_reader :ch

  def initialize(*args)
    super(*args)
    @result = []
  end

  def receive_event
    # Returns distinguishing event identifier (@ch in this case)
    @ch = STDIN.getc
  end

  def ignore; end

  def start_new_string
    @result = []
  end

  def add_current_to_string
    @result << @ch
  end

  def finish_current_string
    puts @result.join
  end
end

# Move generic state machine into its own class,
# initialized by passing in a table of transitions and an initial state

parse_sm = StringParser.new(TRANSITIONS, :look_for_string)
loop do
  parse_sm.process
  break unless parse_sm.ch
end

# state = :look_for_string
# result = []
# while (ch = STDIN.getc)
#   state, action = TRANSITIONS[state][ch] || TRANSITIONS[state][:default]
#   case action
#   when :ignore                then nil
#   when :start_new_string      then result = []
#   when :add_current_to_string then result << ch
#   when :finish_current_string then puts result.join
#   end
# end
