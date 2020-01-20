# frozen_string_literal: true

# Pet dragon from Pine ch 13.5
class Dragon
  def initialize(name)
    @name = name
    @asleep = false
    @stuff_in_belly = 10
    @stuff_in_intestine = 0
    puts "#{ @name } is born."
  end

  def feed
    puts "You feed #{ @name }"
    @stuff_in_belly = 10
    passage_of_time
  end

  def walk
    puts "You walk #{ @name }."
    @stuff_in_intestine = 0
    passage_of_time
  end

  def put_to_bed
    puts "You put #{ @name } to bed."
    @asleep = true
    3.times do
      passage_of_time if @asleep
      puts "#{ @name } snores, filling the room with smoke." if @asleep
    end
    @asleep = false
    puts "#{ @name } wakes up slowly." if @asleep
  end

  def toss
    puts "You toss #{ @name } up into the air."
    puts 'He giggles, which singes your eyebrows.'
    passage_of_time
  end

  def rock
    puts "You rock #{ @name } gently."
    @asleep = true
    puts 'He briefly dozes off...'
    passage_of_time
    return unless @asleep

    @asleep = false
    puts '...but wakes when you stop.'
  end

  private

  def hungry?
    @stuff_in_belly <= 2
  end

  def poopy?
    @stuff_in_intestine >= 8
  end

  def wake_suddenly
    return unless @asleep

    @asleep = false
    puts 'He wakes up suddenly!'
  end

  def digest_or_starve
    if @stuff_in_belly < 1
      wake_suddenly
      puts "#{ @name } is starving! In desperation, he ate YOU!"
      exit
    end
    @stuff_in_belly -= 1
    @stuff_in_intestine += 1
  end

  def act_hungry
    wake_suddenly
    puts "#{ @name }'s stomach grumbles..."
  end

  def act_poopy
    wake_suddenly
    puts "#{ @name } does the potty dance..."
  end

  def make_a_doo_doo
    @stuff_in_intestine = 0
    puts "Whoops!  #{ @name } had an accident..."
  end

  def passage_of_time
    digest_or_starve

    make_a_doo_doo if @stuff_in_intestine >= 10

    act_hungry if hungry?

    act_poopy if poopy?
  end
end

pet = Dragon.new 'Norbert'

loop do
  print ': '
  case gets.chomp
  when 'feed' then pet.feed
  when 'walk' then pet.walk
  when 'put to bed' then pet.put_to_bed
  when 'toss' then pet.toss
  when 'rock' then pet.rock
  else
    puts 'Action unrecognized'
  end
end
