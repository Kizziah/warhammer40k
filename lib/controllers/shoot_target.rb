class ShootTarget
  attr_accessor :target, :shooter, :shoot_rolls, :result

  def initialize(shooter, target, shoot_rolls)
    @shooter = shooter
    @target = target
    @shoot_rolls = shoot_rolls
    @result = result
    shoot
  end

  def shoot
    @result = Shoot.new(shooter, target, shoot_rolls)
  end

end
