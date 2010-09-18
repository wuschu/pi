# Ported from http://nodebox.net/code/index.php/Graphics_State

# This sketch demonstrates how to use the frame rate as orbital state,
# as well as how to use system fonts in Ruby-Processing.

def setup
  size 450, 450
  frame_rate 90
  smooth
  fill 0
  @font = create_font('Helvetica', 40)
  @count = 10 
  @omega = -0.03
end

def draw
  background 255
  translate 225, 225

  text_font @font
  ellipse 0, 0, 10, 10
  text 'sun', 10, 0

  @count.times do |i|
    push_matrix

    rotate( (frame_count * (@omega  / frame_rate) * 2 * PI) + (i * -2 *PI / @count))
    line 0, 0, 120, 0

    translate 120, 0
    ellipse 0, 0, 10, 10
    text_font @font, 22
    text 'planet', 10, 0

    rotate frame_count / 30.0 * PI 
    line 0, 0, 30, 0
    text_font @font, 15
    text 'moon', 32, 0

    pop_matrix
  end
end
