class BlastArea

  attr_accessor :blast

  def initialize(area, strength, ap)
    @blast = Weapon.new(area, strength, ap, 1, "blast" )
    explode
  end

  def blast_area

  end

end
