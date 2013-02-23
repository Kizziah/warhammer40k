class LandRaider < Vehicle
  attr_accessor :tile, :coordinates, :weapons

  def initialize(stats = {})
    @type = 'vehicle'
    @crew = Marine.create
    @bs = 4
    @front_armour = 14
    @back_armour = 14
    @side_armour = 14
    @hp = 4
    @bs_weapon_1 = @@heavybolter
    @bs_weapon_2 = @@lascannon
    @bs_weapon_3 = @@lascannon
    @weapons = []
    @weapons << bs_weapon_1 << bs_weapon_2 << bs_weapon_3
    @transport_capacity = 10
  end

  def shoot(target)
    @crew.tile = self.tile
    @crew.bs_weapon = @bs_weapon_2
    @crew.shoot(target)
  end

  def destroy_random_weapon
    roll = Dice.roll
    if roll == 1 || roll == 2
        destroy_bs_weapon_1
      elsif roll == 3 || roll == 4
        destroy_bs_weapon_2
      elsif roll == 5 || roll == 6
       destroy_bs_weapon_3
    end
  end

  def destroy_bs_weapon_1
    if bs_weapon_1.range != 0
      bs_weapon_1.range = 0
    else
      destroy_random_weapon
    end
  end

  def destroy_bs_weapon_2
    if bs_weapon_2.range != 0
      bs_weapon_2.range = 0
    else
      destroy_random_weapon
    end
  end

  def destroy_bs_weapon_3
    if bs_weapon_3.range != 0
      bs_weapon_3.range = 0
    else
      destroy_random_weapon
    end
  end
end
