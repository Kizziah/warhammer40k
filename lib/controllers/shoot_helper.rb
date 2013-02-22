class ShootHelper

  attr_accessor :shooter, :target, :shooter_rolls, :result, :all_units

  def initialize(shooter, target, shooter_rolls, all_units)
    @shooter = shooter
    @target = target
    @shooter_rolls = shooter_rolls
    @all_units = all_units
    setup_shot
  end

  def setup_shot
    shoot_troop if target.type == 'troop'
    shoot_vechicle if target.type == 'vechicle'
    blast_area if target.type == 'blast_area'
  end

  def shoot_troop
    Shoot.new(shooter, target, shooter_rolls)
  end

  def shoot_vechicle
    ShootVechicle.new(shooter, target, shooter_rolls, all_units)
  end

  def blast_area
    BlastArea.new(shooter, target, shooter_rolls)
  end
end
