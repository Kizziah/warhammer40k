class VehicleExplosion

  attr_accessor :blast, :tile, :target, :shooter, :area, :all_units

  def initialize(area, target, all_units = {} )
    @blast = Weapon.new(area, 3, 7, 1, "blast" )
    @target = target
    @area = area
    @all_units = all_units
    units_in_blast_area
  end

  def units_in_blast_area
    starting_point = target
    @all_units.each do |troop|
      if distance_tile(starting_point.tile, troop.tile) <= area.to_i && troop.type == 'troop'
        damage(troop)
      end
    end
  end

  def damage(troop)
    generic = Marine.create
    generic.bs_weapon = blast
    Shoot.new(generic, troop, hit:6)
  end

end
