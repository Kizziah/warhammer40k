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

tyler = Cultist.new
havoc = Havoc.new
tank = LandRaider.new



havoc.shoot(tank, hit: 5, strength: 6)
puts tank.wrecked?

# puts tyler.s




# havoc.shoot(tank)
# puts havoc.broken?
