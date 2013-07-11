class Dreadnought < Vehicle

  attr_accessor :tile, :coordinates, :mobility, :ws, :a, :i, :s, :ws_weapon

  def initialize(stats = {})
    @type = :walker
    @s = 4
    @a = 2
    @i = 4
    @crew = 4
    @bs = 4
    @ws = 4
    @front_armour = 12
    @back_armour = 12
    @side_armour = 11
    @hp = 3
    @bs_weapon_1 = Weapon.assault_cannon
    @bs_weapon_2 = Weapon.stormbolter
    @ws_weapon = Weapon.powerfist
    @transport_capacity = 10
  end
end

def add_weapon_points
  self.points += case weapon.type
  when :lascannon then 30
  when :plasmacannon, :autocannon, :heavyflamer then 10
  when :heavybolter then 5
  end

end
