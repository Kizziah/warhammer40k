class ShootHelper

  attr_accessor :shooter, :target, :shooter_rolls, :result

  def initialize(shooter, target, shooter_rolls)
    @shooter = shooter
    @target = target
    @shooter_rolls = shooter_rolls
    setup_shot
  end

  def setup_shot
    shoot_troop if target.type == 'troop'
    shoot_vechicle if target.type == 'vechicle'
  end

  def shoot_troop
    Shoot.new(shooter, target, shooter_rolls)
  end

  def shoot_vechicle
    ShootVechicle.new(shooter, target, shooter_rolls)
  end

  def expolsion

  end
end
