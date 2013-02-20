class Squad < Array

  attr_accessor :coordinates, :tile, :targetable, :combat, :moved, :option, :fired, :assaulted, :troops, :num, :leader, :broken
  attr_reader :faction, :name

  def initialize(name, faction, option, troop, number)
    @name = name
    @faction = faction
    @option = option
    @num = number.to_i
    @troops = troop
    num.times { self << troop.new }
  end

  def broken?
    self.broken == true
  end

  def break_test
    self.broken = true if Dice.roll_2dice > troops.ld
  end

  def quarter_of_a_squad
    quarter_squad = self.length / 4
  end

  def add_leader(leader)
    @leader = leader
    self << leader
  end

  def drop_dead_troops
    self.delete_if { |troop| troop.dead? }
  end

  def out_of_range?(target)
    distance_tile(self.tile, target.tile) > self.last.bs_weapon.range
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
end
