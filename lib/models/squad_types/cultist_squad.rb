class CultistSquad < DefaultSquad

  attr_accessor :troops, :leader, :points, :gunnys, :heavys

  attr_reader :faction, :name

  Largest_Squad = 35

  def initialize
    @heavys = []
    @troops = []
    @gunnys = []
    @name = :ChoasMarine
    @faction = :Choas
    9.times { @troops << Cultist.create }
    @leader = CultistSergeant.create
    self << @troops
    self << @leader
    self << @gunnys
    @points = 50
  end

  def add_troop(number = 1)
    number = 25 if number >= 26
    troop = Cultist.create
    number.times { @troops << Cultist.create }
    number.times { @points += troop.points }
  end

  def replace_pistol_with_gun
    x = self.troop.pop
    x.bs_weapon = Weapon.autogun
    x.ws_weapon = Weapon.knive
    gunnys << x
    points += 1
  end

  def add_heavy_weapon(type)

  end

end
