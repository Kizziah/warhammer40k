class ShootVehicle

  attr_reader :result, :hit_roll, :chart_roll, :penetration_roll, :area_roll, :bs,
              :target, :weapon, :shooter, :all_units

  def initialize(shooter, target, shooter_rolls = {}, all_units = {} )
    @hit_roll = shooter_rolls[:hit] || Dice.roll
    @penetration_roll = shooter_rolls[:strength] || Dice.roll
    @chart_roll = shooter_rolls[:chart] || Dice.roll
    @area_roll = shooter_rolls[:area] || Dice.roll
    @target = target
    @shooter = shooter
    @weapon = shooter.bs_weapon
    @bs = @shooter.bs
    @all_units = all_units
    hit_test
  end

  def hit_test
    if hit_target?
      vehicle_armor_test
    else
      miss
    end
  end

  def vehicle_armor_test
   vehicle_damage_chart if target.front_armour < penetration_test
   target.hp -= 1 if target.front_armour == penetration_test
  end

  def ap_bonus
  @chart_roll += 1 if weapon.ap == 2
  @chart_roll += 2 if weapon.ap == 1
  end

  def vehicle_damage_chart
    ap_bonus if weapon.ap <= 2
    target.hp -= 1
    chart_result = case chart_roll
    when 1 then crew_shaken
    when 2 then crew_shaken
    when 3 then crew_stunned
    when 4 then weapon_destroyed
    when 5 then immombilised
    when 6 then explode
    when 7 then explode
    when 8 then explode
    end
  end

  def hit_target?
    roll_needed = case bs
    when 5 then 2
    when 4 then 3
    when 3 then 4
    when 2 then 5
    end
    hit_roll >= roll_needed
  end

  def weapon_destroyed
    target.destroy_random_weapon
  end

  def crew_stunned
    target.crew = 'stunned'
  end

  def explode
    target.hp = 0
    area = Dice.roll
    VehicleExplosion.new(area_roll, target, @all_units)
  end

  def miss
    @result = 'miss'
  end

  def immombilised
    target.mobility = false
  end

  def crew_shaken
    target.crew = 'shaken'
  end

  def wreck
    target.hp = 0
  end

  def penetration_test
    weapon.strength.to_i + penetration_roll
  end
end
