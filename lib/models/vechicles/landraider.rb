class LandRaider < Vechicle
  attr_accessor :tile, :coordinates

  def initialize(stats = {})
    @type = 'vechicle'
    @crew = 4
    @bs = 4
    @front_armour = 14
    @back_armour = 14
    @side_armour = 14
    @hp = 4
    @bs_weapon_1 = Weapon.new(36, 5, 5, 3, "twin-linked heavybolter")
    @bs_weapon_2 = Weapon.new(48, 9, 2, 1, 'twin-linked lascannon')
    @bs_weapon_3 = Weapon.new(48, 9, 2, 1, "twin-linked lascannon")
    @transport_capacity = 10
  end
end
