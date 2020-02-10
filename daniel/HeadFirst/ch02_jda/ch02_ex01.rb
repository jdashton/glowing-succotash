# frozen_string_literal: true

def paragraph(content)
  '<p>' + content + '</p>'
end

def image(source, width = 100, height = 100)
  "<img src='#{ source }' width='#{ width }' height='#{ height }'/>"
end

puts paragraph('This is my paragraph')
puts image('puppy.jpg', 800, 600)
