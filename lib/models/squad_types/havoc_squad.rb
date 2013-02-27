class HavocSquad < Array

  attr_accessor  :coordinates, :tile, :targetable, :combat, :moved, :option,
                 :fired, :assaulted, :troops, :num, :leader, :points, :broken, :gunny

  attr_reader :faction, :name

  def initialize
    @gunny = []
    @troops = []
    @name = 'Havoc'
    @faction = 'Choas'
    4.times { @troops << ChoasMarine.create }
    @leader = MarineSergeant.create
    self << @troops
    self << @leader
    self << @gunny
    @points = 75
  end

  def add_troop(num = {} )
    num = 1 if num == {}
    num = 5 if num >= 6
    troop = ChoasMarine.create
    num.times { @troops << ChoasMarine.create }
    num.times { @points += troop.points }
  end

  def add_weapon(weapon)
    if gunny.length < 4 && weapon_allowed?(weapon)
      convert_troop_to_gunny(weapon)
    else
      @invalid_request = true
    end
    add_weapon_points(weapon) unless @invalid_request == true
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

  def convert_troop_to_gunny(weapon)
    self.troops.last.bs_weapon = (weapon)
    new_gunny = self.troops.pop
    gunny << new_gunny
  end

  def weapon_allowed?(weapon)
    weapon.type == 'lascannon' || weapon.type == 'meltagun' ||
    weapon.type == 'heavybolter' || weapon.type == 'krakmissle' || weapon.type == 'plasma_gun'
  end

  def add_weapon_points(weapon)
    if weapon.type == 'lascannon'
      self.points += 20
    elsif weapon.type == 'krakmissle'
      self.points += 15
    elsif weapon.type == 'plasma_gun'
      self.points += 15
    elsif weapon.type == 'meltagun'
      self.points += 10
    elsif weapon.type == 'heavybolter'
      self.points += 10
    end
  end

  def subtract_weapon_points(weapon)
    if weapon.type == 'lascannon'
      self.points -= 20
    elsif weapon.type == 'krakmissle'
      self.points -= 15
    elsif weapon.type == 'plasma_gun'
      self.points -= 15
    elsif weapon.type == 'meltagun'
      self.points -= 10
    elsif weapon.type == 'heavybolter'
      self.points -= 10
    end
  end
end

