require_relative 'lib/40k'
# require 'gosu'

game = Game.new
choas = game.choas_army
marine = game.marine_army

game.turn(choas, marine)

# class GameWindow < Gosu::Window
#   def initialize
#     super 640, 480, false
#     self.caption = "WarHammer 40k"
#     @background_image = Gosu::Image.new(self, "lib/assets/grass.png", true)
#   end

#   def update
#   end

#   def draw
#     @background_image.draw(0, 0, 0)
#   end
# end

# window = GameWindow.new
# window.show
