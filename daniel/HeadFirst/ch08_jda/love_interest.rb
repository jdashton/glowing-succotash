class LoveInterest
  def request_date
    if @busy
      puts "Sorry, I'm busy."
    else
      puts "Sure, let's go!"
      @busy = true
    end
  end
end

betty = LoveInterest.new
candace = betty

puts betty.request_date
puts candace.request_date

p betty.object_id
p candace.object_id
