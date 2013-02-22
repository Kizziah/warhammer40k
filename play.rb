require_relative 'lib/40k'


marine = Marine.new
puts marine.bs_weapon.type

marine.new_bs_weapon(Weapon.new(4, 2, 4, 2, "dsdfa"))
puts marine.bs_weapon.type
