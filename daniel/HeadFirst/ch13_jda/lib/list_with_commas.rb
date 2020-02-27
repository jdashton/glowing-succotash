# How to join list items
class ListWithCommas
  attr_accessor :items
  def join
    case items.length
    when 1 then items[0]
    when 2 then items.join(' and ')
    else
      (items[0..-2] << "and #{ items.last }").join(', ')
    end
  end
end

if $PROGRAM_NAME == __FILE__
  two_subjects = ListWithCommas.new
  two_subjects.items = ['my parents', 'a rodeo clown']
  puts "A photo of #{ two_subjects.join }"

  three_subjects = ListWithCommas.new
  three_subjects.items = ['my parents', 'a rodeo clown', 'a prize bull']
  puts "A photo of #{ three_subjects.join }"

  one_subject = ListWithCommas.new
  one_subject.items = ['a rodeo clown']
  puts "A photo of #{ one_subject.join }"
end
