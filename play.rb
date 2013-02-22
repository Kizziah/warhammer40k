require_relative 'lib/40k'

# require 'gosu'

# game = Game.new
# choas = game.choas_army
# marine = game.marine_army

# havoc = Squad.new("Havoc", 'choas', 1, Havoc.new, 4, )
# cultist = Squad.new("cultist", 'choas', 2, Cultist.new, 7 )

# havoc.add_leader(MarineSergeant.new)

# puts cultist

# puts havoc.troops.ld

# havoc.break_test

@landraider = LandRaider.new
@havoc = Havoc.new
@cultist = Cultist.new
@board = Board.new(10, 10)
@board.place_troop(@landraider, 4, 2)
@board.place_troop(@cultist, 4, 1)
@board.place_troop(@havoc, 9, 9)
@all_units = @board.all_units

puts distance_tile(@landraider.tile, @cultist.tile)

@havoc.shoot(@landraider, {hit: 6, strength: 6, chart: 6 }, @all_units )
puts @landraider.wrecked?
puts @cultist.dead?

# def within_range?(target)
#   distance_tile(tile, ) < inches
# end

# havoc.shoot(tank)
# puts havoc.broken?
