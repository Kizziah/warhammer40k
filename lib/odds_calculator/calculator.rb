require_relative '../lib/40k'

tank = LandRaider.create
havoc = Havoc.create
marine = Marine.create
havoc.bs_weapon = @@heavybolter
board = Board.new(30, 30)
board.place_troop(havoc , 2, 2)
board.place_troop(marine, 20, 10)
board.place_troop(tank, 15, 10)


