class ShootHelper

  attr_accessor :shooter, :target, :shooter_rolls, :result, :all_units, :weapon

  def initialize(shooter, target, shooter_rolls, all_units)
    @shooter = shooter
    @target = target
    @weapon = shooter.bs_weapon
    @shooter_rolls = shooter_rolls
    @all_units = all_units
    special_weapon_bonus
  end

  def shoot_troop
    Shoot.new(shooter, target, shooter_rolls)
  end

  def shoot_vehicle
    ShootVehicle.new(shooter, target, shooter_rolls, all_units)
  end

  def blast_area
    VehicleExplosion.new(shooter, target, shooter_rolls)
  end

  def special_weapon_bonus
    number_of_shots = @weapon.shots
    distance = distance_tile(shooter.tile, target.tile)
    half_weapon_range = weapon.range / 2
    if weapon.special == 'rapidfire' && distance <= half_weapon_range
      number_of_shots += 1
    end

    determine_number_of_shots(number_of_shots)
  end

  def determine_number_of_shots(number_of_shots)
    number_of_shots.times do
    setup_shot
    end
  end

  def setup_shot
    shoot_troop if target.type == 'troop'
    shoot_vehicle if target.type == 'vehicle'
    blast_area if target.type == 'blast_area'
  end
end
