class ShootVehicle
  $results = []
  attr_reader :result, :hit_roll, :chart_roll, :penetration_roll, :area_roll, :bs,
              :target, :weapon, :shooter, :all_units

  def initialize(shooter, target, shooter_rolls = {})
    @hit_roll = shooter_rolls[:hit] || Dice.roll
    @penetration_roll = shooter_rolls[:strength] || Dice.roll
    @chart_roll = shooter_rolls[:chart] || Dice.roll
    @area_roll = shooter_rolls[:area] || Dice.roll
    @target = target
    @shooter = shooter
    @weapon = shooter.bs_weapon
    @bs = @shooter.bs
    @all_units = all_units
    vehicle_armor_test
  end

  def vehicle_armor_test
   vehicle_damage_chart if target.front_armour < penetration_test
    if target.front_armour == penetration_test
      target.hp -= 1
      @result = 'glance'
      $results << @result
    end
    if target.front_armour > penetration_test
      @result = 'no damage'
      $results << @result
    end
  end

  def ap_bonus
  @chart_roll += 1 if weapon.ap == 2
  @chart_roll += 2 if weapon.ap == 1
  end

  def vehicle_damage_chart
    ap_bonus if weapon.ap <= 2
    target.hp -= 1
    chart_result = case @chart_roll
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
    @result = 'weapon destroyed'
    $results << @result
  end

  def crew_stunned
    target.crew = 'stunned'
    @result = 'stunned'
    $results << @result
  end

  def explode
    target.hp = 0
    @result = 'explode'
    $results << @result
    # VehicleExplosion.new(area_roll, target, @all_units)
  end

  def miss
    @result = 'miss'
    $results << @result
  end

  def immombilised
    target.mobility = false
    @result = 'immombilised'
    $results << @result
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
