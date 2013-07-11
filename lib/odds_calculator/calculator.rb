require_relative '../40k'

rhino = Rhino.new
havoc = Havoc.create
tank = LandRaider.create
marine = Marine.create
terminator = Terminator.create
son10k = ThousandSon.create
marine.bs_weapon = Weapon.heavybolter


kills = 0
miss = 0
svt = 0
armor = 0
autosave = 0
no_damage = 0
explode = 0
glance = 0
weapon = 0
mobile = 0
stunned = 0
havoc.bs_weapon = Weapon.lascannon
100.times do

havoc.shoot(rhino)
end

$results.each {|wound| kills += 1 if wound == :WOUND  }
$results.each {|wound| miss += 1 if wound == "miss"  }
$results.each {|wound| svt += 1 if wound == "SvsT"  }
$results.each {|wound| armor += 1 if wound == "ARMOR"  }
$results.each {|wound| autosave += 1 if wound == "AUTOSAVE"  }
$results.each {|wound| glance += 1 if wound == "glance"  }
$results.each {|wound| no_damage += 1 if wound == "no damage"  }
$results.each {|wound| explode += 1 if wound == "explode"  }
$results.each {|wound| weapon += 1 if wound == "weapon destroyed"  }
$results.each {|wound| mobile += 1 if wound == "immombilised"  }
$results.each {|wound| stunned += 1 if wound == "stunned"  }

# puts $results
# puts kills
puts miss.to_s
# puts svt
# puts armor
# puts autosave

puts glance.to_s + " glancing"
puts no_damage.to_s + " no damage"
puts explode.to_s + ' explode'
puts weapon.to_s + ' weapon destroyed'
puts mobile.to_s + 'mobile'
puts stunned
