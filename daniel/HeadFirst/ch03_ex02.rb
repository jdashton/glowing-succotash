# frozen_string_literal: true

# Confection
class Confection
  def prepare
    # Don't duplicate this line in the subclass!
    puts 'Baking at 350 degrees for 25 minutes.'
  end
end

# CREATE YOUR Cupcake SUBCLASS HERE!
class Cupcake < Confection
  def prepare
    super
    puts 'Applying frosting.'
  end
end

# The below code should output the following
# 2 lines of text:
#
# Baking at 350 degrees for 25 minutes.
# Applying frosting.
cupcake = Cupcake.new
cupcake.prepare
