require 'time'

# Today is Thursday, April 14, 2016

puts Time.now.strftime('Today is %A, %B %e, %Y')

# You’ll need to call a class method to get an object representing the current date and time.
# You’ll call instance methods on that object to get the day of week, month, day of month, and year.
# You’ll get the day of the week back as a number. You’ll need to build an array or hash that can help you convert it to a string.
# The month will also come back as a number. Build a hash to help you convert it to a string.
# Interpolate all these values into a string to get the correct format.