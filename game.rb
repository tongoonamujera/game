require 'gosu'

class GameScreen < Gosu::Window
  def initialize(width= 520, height = 320, fullscreen = false)
    super
    self.caption = 'Hello'
    @x = @y = 10
    @draws = 0
    @buttons_down = 0
  end

  def update
    @x -= 1 if button_down?(Gosu::KbLeft)
    @x += 1 if button_down?(Gosu::KbRight)
    @y -= 1 if button_down?(Gosu::KbUp)
    @y += 1 if button_down?(Gosu::KbDown)
  end

  def button_down(id)
    close if id == Gosu::KbEscape
    @buttons_down += 1
  end

  def button_up(id)
    @buttons_down -= 1
  end

  def needs_redraw?
    @draws == 0 || @buttons_down > 0
  end

  def draw
    @draws += 1
    @message = Gosu::Image.from_text(self, "#{screen}", Gosu.default_font_name, 30)
    @message.draw(@x, @y, 0)
  end

  def screen
    "|0|1|2|\n"
  end

  def time
    a = Time.now
  end
end

window = GameScreen.new
window.show