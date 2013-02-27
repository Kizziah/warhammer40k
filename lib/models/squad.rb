class Squad < Array

  attr_accessor :coordinates, :tile, :targetable, :combat, :moved, :option,
                :fired, :assaulted, :troops, :num, :leader, :points, :broken

  attr_reader :faction, :name

  def initialize(name, faction, option, troop, number)
    @name = name
    @faction = faction
    @option = option
    @num = number.to_i
    @troops = troop
    num.times { self << troop.new }
  end

  def add_leader(leader, weapon = {})
    leader.bs_weapon = weapon unless weapon == {}
    @leader = leader
    self << leader
  end

  def add_troop(type, weapon = {})
  type.bs_weapon = weapon unless weapon == {}
     self << type
     self.points += type.points
  end

  # def equip_bs_weapon(troop, weapon)
  #   troop.bs_weapon = weapon
  #   self.points += weapon.points
  # end

  def drop_dead_troops
    self.delete_if { |troop| troop.dead? }
  end

  def out_of_range?(target)
    distance_tile(self.tile, target.tile) > self.last.bs_weapon.range
  end

  def break_test(roll = {})
    roll = roll[:roll] || Dice.roll_2dice

    if leader == nil || leader.dead? == true
      self.broken = true if roll > troops.ld
    else
      self.broken = true if roll > leader.ld
    end
  end

  def fired?
    self.fired == true
  end

  def moved?
    self.moved == true
  end

  def wiped?
    self.length == 0
  end

  def broken?
    self.broken == true
  end

  def quarter_of_a_squad
    quarter_squad = self.length / 4
  end
end
