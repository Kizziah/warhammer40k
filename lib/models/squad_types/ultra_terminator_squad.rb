class UltraTerminatorSquad < Array

 attr_accessor  :coordinates, :tile, :targetable, :combat, :moved, :option, :gunny,
                :fired, :assaulted, :troops, :num, :leader, :points, :broken

  attr_reader :faction, :name

  def initialize
    @gunny = []
    @troops = []
    @name = :ChoasMarine
    @faction = :Choas
    4.times { @troops << Terminator.create }
    @leader = Terminator.create
    self << @troops
    self << @leader
    self << @gunny
    @points = 200
  end

  def add_troop(num = {} )
    num = 1 if num == {}
    num = 5 if num >= 6
    troop = Terminator.create
    num.times { @troops << Terminator.create }
    num.times { @points += troop.points }
  end

  def add_weapon(weapon)
    if squad_size < 10 && gunny.length == 0 && weapon_allowed?(weapon)
      convert_troop_to_gunny(weapon)
      add_weapon_points(weapon)
    end

    if squad_size == 10 && gunny.length == 0 && weapon_allowed?(weapon)
      convert_troop_to_gunny(weapon)
      add_weapon_points(weapon)
    elsif  squad_size == 10 && gunny.length == 1 && weapon_allowed?(weapon)
      convert_troop_to_gunny(weapon)
      add_weapon_points(weapon)
    end
  end

  def change_weapon(new_weapon, old_weapon)
    add_count = 0
    gunny.each do |troop|
      if troop.bs_weapon.type == old_weapon.type && weapon_allowed?(new_weapon) && add_count == 0
        troop.bs_weapon = new_weapon
        add_count += 1
      end
    end

    if weapon_allowed?(new_weapon) && weapon_allowed?(old_weapon) && add_count > 0
      add_weapon_points(new_weapon)
      subtract_weapon_points(old_weapon)
    end
  end

  def weapon_allowed?(weapon)
    [:assault_cannon, :krakmissle, :heavyflamer].include?(weapon.type.to_sym)
  end

  def convert_troop_to_gunny(weapon)
    self.troops.last.bs_weapon = (weapon)
    new_gunny = self.troops.pop
    gunny << new_gunny
  end

  def add_weapon_points(weapon)
    self.points += case weapon.type.to_sym
    when :assault_cannon, :krakmissle then 30
    when :heavyflamer then 5
    end
  end

  def subtract_weapon_points(weapon)
    self.points -= case weapon.type.to_sym
    when :assault_cannon, :krakmissle then 30
    when :heavyflamer then 5
    end
  end

  def squad_size
    self.flatten.length
  end

end
