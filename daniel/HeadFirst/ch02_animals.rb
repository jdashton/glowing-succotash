# frozen_string_literal: true

def talk(animal_type, name)
  print "#{ name } says "
  puts case animal_type
       when 'bird' then 'Chirp! Chirp!'
       when 'dog'  then 'Bark!'
       when 'cat'  then 'Meow!'
       end
end

def move(animal_type, name, destination)
  print "#{ name } "
  print case animal_type
        when 'bird' then 'flies'
        when 'dog', 'cat' then 'runs'
        end
  puts " to the #{ destination }."
end

def report_age(name, age)
  puts "#{ name } is #{ age } years old."
end

move('bird', 'Whistler', 'tree')
talk('dog', 'Sadie')
talk('bird', 'Whistler')
move('cat', 'Smudge', 'house')
report_age('Smudge', 6)
