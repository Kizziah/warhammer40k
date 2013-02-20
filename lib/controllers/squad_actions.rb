
def show_squads(army)
  army.collect do |m|
  squads = m.name
  puts squads
  end
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
