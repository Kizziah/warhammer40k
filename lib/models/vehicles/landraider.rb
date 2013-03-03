class LandRaider < Vehicle
  attr_accessor :tile

  def self.create(stats = {})
    new(
      :front_armour => stats[:front_armour] || 14,
      :back_armour => stats[:back_armour] || 14,
      :side_armour => stats[:side_armour] || 14,
      :hp => stats[:hp] || 4,
      :bs_weapon_1 => stats[:bs_weapon_1] || Weapon.heavybolter,
      :bs_weapon_2 => stats[:bs_weapon_2] || Weapon.twinlinkedlascannon,
      :bs_weapon_3 => stats[:bs_weapon_3] || Weapon.twinlinkedlascannon,
      :transport_capacity => stats[:points] || 10
  )
  end

  def assign_crew_weapons
    @gunner_1 = TankGunner.create
    @gunner_1.bs_weapon = bs_weapon_1
    @gunner_2 = TankGunner.create
    @gunner_2.bs_weapon = bs_weapon_2
    @gunner_3 = TankGunner.create
    @gunner_3.bs_weapon = bs_weapon_3
  end

  def shoot_weapon_1(target)
    @gunner_1.tile = self.tile
    @gunner_1.shoot(target)
  end

  def shoot_weapon_2(target)
    @gunner_2.tile = self.tile
    @gunner_2.shoot(target)
  end

  def shoot_weapon_3(target)
    @gunner_3.tile = self.tile
    @gunner_3.shoot(target)
  end

  def destroy_random_weapon
    # roll = 1 + rand(6)
    # if roll == 1 || roll == 2
    #     destroy_bs_weapon_1
    #   elsif roll == 3 || roll == 4
    #     destroy_bs_weapon_2
    #   elsif roll == 5 || roll == 6
    #    destroy_bs_weapon_3
    # end
  end

  def destroy_bs_weapon_1
    if @gunner_1.bs_weapon.range != 0
        @gunner_1.bs_weapon.range = 0
    else
      destroy_random_weapon
    end
  end

  def destroy_bs_weapon_2
    if @gunner_2.bs_weapon.range != 0
        @gunner_2.bs_weapon.range = 0
    else
      destroy_random_weapon
    end
  end

  def destroy_bs_weapon_3
    if @gunner_3.bs_weapon.range != 0
        @gunner_3.bs_weapon.range = 0
    else
      destroy_random_weapon
    end
  end
end
