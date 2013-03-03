class HavocSquad < DefaultSquad

  attr_accessor  :troops, :champion, :points, :havocs

  attr_reader :faction, :name

  def initialize
    @havocs = []
    @troops = []
    @name = 'Havoc'
    @faction = 'Choas'
    4.times { @troops << ChoasMarine.create }
    @champion = MarineSergeant.create
    self << @troops
    self << @leader
    self << @havocs
    @points = 75
  end

  def add_troop(number = 1)
    number = 5 if number >= 6
    troop = ChoasMarine.create
    number.times { @troops << ChoasMarine.create }
    number.times { @points += troop.points }
  end

  def add_weapon(weapon)
    raise "#{weapon.type} is not allowed" unless weapon_allowed?(weapon)
    if havocs.length < 4
      convert_troop_to_havoc(weapon)
      add_weapon_points(weapon)
    end
  end

  def change_weapon(new_weapon, old_weapon)
    raise "#{new_weapon.type} is not allowed" unless weapon_allowed?(new_weapon)
    troop = havocs.detect { |t| t.bs_weapon.type == old_weapon.type }
    if troop
      troop.bs_weapon = new_weapon
      add_weapon_points(new_weapon)
      subtract_weapon_points(old_weapon)
    end
  end

  def convert_troop_to_havoc(weapon)
    self.troops.last.bs_weapon = (weapon)
    new_havoc = self.troops.pop
    havocs << new_havoc
  end

  def weapon_allowed?(weapon)
    [:lascannon, :meltagun, :heavybolter, :krakmissle, :plasma_gun].include?(weapon.type.to_sym)
  end

  def add_weapon_points(weapon)
    self.points += case weapon.type.to_sym
    when :lascannon then 20
    when :krakmissle, :plasma_gun then 15
    when :meltagun, :heavybolter then 10
    end
  end

  def subtract_weapon_points(weapon)
    self.points -= case weapon.type.to_sym
    when :lascannon then 20
    when :krakmissle, :plasma_gun then 15
    when :meltagun, :heavybolter then 10
    end
  end
end

