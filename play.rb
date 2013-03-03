require_relative 'lib/40k'

# havoc = Havoc.create
# tank = LandRaider.create
# marine = Marine.create
terminator = Terminator.create
choas = ThousandSon.create

# Weapon.twinlinkedlascannon.use(havoc, choas, hit: 1)
# # puts $results

squad_2 = ThousandSonSquad.new
choas_squad = ThousandSonSquad.new
squad = ChoasMarineSquad.new
havoc = HavocSquad.new


squad.add_troop
# squad.add_troop
# squad.add_weapon(Weapon.meltagun)

# squad.shoot(squad_2)
# puts $results
# terminator.shoot(choas)

choas_squad.shoot(squad)
puts $results

puts squad


squad.shoot(choas_squad)
puts $results

puts choas_squad
