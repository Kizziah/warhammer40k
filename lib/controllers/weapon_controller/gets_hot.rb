class GetsHot

  attr_accessor :shooter

  def initialize(shooter)
    @shooter = shooter
    attack_self
  end

  def attack_self
    generic = Cultist.create
    Shot.new(generic, shooter, roll: 6, strength: 6 )
  end

end
