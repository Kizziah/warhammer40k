class ChoasMarineSquad < DefaultSquad

  attr_accessor :havocs, :troops, :leader, :points, :gunnys

  attr_reader :faction, :name

  Largest_Squad = 10

  def initialize
    @havocs = []
    @troops = []
    @gunnys = []
    @name = :ChoasMarine
    @faction = :Choas
    4.times { @troops << ChoasMarine.create }
    @leader = MarineSergeant.create
    self << @troops
    self << @leader
    self << @havocs
    self << @gunnys
    @points = 75
  end

  def add_troop(number = 1)
    number = 15 if number >= 16
    troop = ChoasMarine.create
    number.times { @troops << ChoasMarine.create }
    number.times { @points += troop.points }
  end

  def add_weapon(weapon)
    raise raise "#{weapon.type} is not allowed" unless legit_weapon?(weapon)

    if gunnys.length == 0 && weapon_allowed_gunny?(weapon)
      convert_troop_to_gunny(weapon)
      add_weapon_points(weapon)
    elsif havocs.length == 0 && squad_size >= 10
      convert_troop_to_havoc(weapon)
      add_weapon_points(weapon)
    end
  end

  def convert_troop_to_gunny(weapon)
    self.troops.last.bs_weapon = (weapon)
    new_gunny = self.troops.pop
    gunnys << new_gunny
  end

  def convert_troop_to_havoc(weapon)
    self.troops.last.bs_weapon = (weapon)
    new_havoc = self.troops.pop
    havocs << new_havoc
  end


  # Allowed if squad size is 10, only 1 is allowed per squad.
  #
  def biggun?(weapon)
    [:lascannon, :heavybolter, :krakmissle].include?(weapon.type.to_sym)
  end

  def weapon_allowed_gunny?(weapon)
   [:meltagun, :plasma_gun].include?(weapon.type.to_sym)
  end

  def weapon_allowed_havoc?(weapon)
    [:lascannon, :meltagun, :heavybolter, :krakmissle, :plasma_gun].include?(weapon.type.to_sym)
  end

  def legit_weapon?(weapon)
    weapon_allowed_gunny?(weapon)
    weapon_allowed_havoc?(weapon)
  end

  def convert_havoc_to_troop
   havocs.pop
   @troops << ChoasMarine.create
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
