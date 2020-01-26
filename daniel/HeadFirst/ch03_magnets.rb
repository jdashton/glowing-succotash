# frozen_string_literal: true

# Camera
class Camera
  def load
    puts 'Winding film.'
  end

  def take_picture
    puts 'Triggering shutter.'
  end
end

# DigitalCamera
class DigitalCamera < Camera
  def load
    puts 'Inserting memory card.'
  end
end

camera = Camera.new
camera.load
camera.take_picture

camera2 = DigitalCamera.new
camera2.load
camera2.take_picture

# Winding film.
# Triggering shutter.
# Inserting memory card.
# Triggering shutter.
