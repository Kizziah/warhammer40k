def show_squads(army)
  army.collect do |m|
  squads = m.name
  puts squads
  end
end

def quarter_of_a_squad(squad)
  quarter_squad = squad.length / 4
end

def squad_shoot(shooter, squad)
  x = squad.length
  shooter.each do |shooter|
    shooter.shoot(squad.last) unless squad.length == 0
    squad.delete_if { |troop| troop.dead? }
  end

  killed = x - squad.length
  puts killed.to_s + ' ' + squad.name.to_s + " killed."
  puts squad.length.to_s + ' remain.'
end

def move_south(map)
  map.move_south(self)
end

def move_north(map)
  map.move_north(self)
end

def move_east(map)
  map.move_east(self)
end

def move_west(map)
  map.move_west(self)
end

def adjust_squad_but_keep_squad_coherrison # all Squads memebers are with in 2 inchesof atleast 1 other troop
end
