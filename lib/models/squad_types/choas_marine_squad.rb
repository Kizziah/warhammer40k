class ChoasMarineSquad < Array

 attr_accessor  :coordinates, :tile, :targetable, :combat, :moved, :option, :gunny,
                :fired, :assaulted, :troops, :num, :leader, :points, :broken

  attr_reader :faction, :name

LargeSquad = 10

  def initialize
    @gunny = []
    @troops = []
    @name = 'ChoasMarine'
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
    num = 15 if num >= 16
    troop = ChoasMarine.create
    num.times { @troops << ChoasMarine.create }
    num.times { @points += troop.points }
  end

  def add_weapon(weapon)
    if gunny.length == 0 && weapon_allowed_1?(weapon) && squad_size <= 10
      convert_troop_to_gunny(weapon)
      add_weapon_points(weapon)
    elsif gunny.length == 0 && weapon_allowed_2?(weapon) && squad_size >= 10
      convert_troop_to_gunny(weapon)
      add_weapon_points(weapon)
    elsif gunny.length == 1 && weapon_allowed_2?(weapon) && squad_size >= 10
      convert_troop_to_gunny(weapon)
      add_weapon_points(weapon)
    end

    if gunny.length == 2
      if biggun?(gunny.last.bs_weapon) && biggun?(gunny.first.bs_weapon)
        subtract_weapon_points(weapon)
        convert_gunny_to_troop
      end
    end

  end

  def convert_troop_to_gunny(weapon)
    self.troops.last.bs_weapon = (weapon)
    new_gunny = self.troops.pop
    gunny << new_gunny
  end

  def squad_size
    self.flatten.length
  end

  def biggun?(weapon) # allowed if squad size is 10, only 1 is allowed per squad.
    weapon.type == 'lascannon' || weapon.type == 'heavybolter' || weapon.type == 'krakmissle' || weapon.type == 'plasma_gun'
  end

  def weapon_allowed_1?(weapon)
    weapon.type == 'plasma_gun' || weapon.type == 'meltagun'
  end

  def weapon_allowed_2?(weapon)
    weapon.type == 'lascannon' || weapon.type == 'meltagun' || weapon.type == 'heavybolter' ||
    weapon.type == 'krakmissle' || weapon.type == 'plasma_gun'
  end

  def convert_gunny_to_troop
   gunny.pop
   @troops << ChoasMarine.create
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
