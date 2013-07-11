class DefaultSquad < Array

 attr_accessor :coordinates, :tile, :targetable, :combat, :moved, :option,
               :fired, :assaulted, :broken

  def show_squads(army)
    army.collect do |m|
    squads = m.name
    puts squads
    end
  end

  def quarter_of_a_squad(squad)
    quarter_squad = squad.length / 4
  end

  def shoot(targets)
    self.flatten!
    targets.flatten!
    self.each do |troop| troop.bs_weapon.use(troop, targets.last)
    targets.kill_troops
    end

  end

  def attack

  end

  def kill_troops
    self.delete_if {|troop| troop.dead? }
  end

  def squad_size
    self.flatten.length
  end


  def break_test(roll = {})
    roll = roll[:roll] || Dice.roll_2dice

    if leader == nil || leader.dead? == true
      self.broken = true if roll > troops.ld
    else
      self.broken = true if roll > leader.ld
    end
  end

end
