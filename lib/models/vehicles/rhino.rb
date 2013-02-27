class Rhino < Vehicle

  attr_accessor :tile, :coordinates, :mobility

  def initialize(stats = {})
    @type = 'vehicle'
    @crew = 4
    @bs = 4
    @front_armour = 11
    @back_armour = 10
    @side_armour = 11
    @hp = 3
    @bs_weapon_1 = @@boltgun
    @transport_capacity = 10
  end

  def destroy_random_weapon
    if @bs_weapon_1.range != 0
      @bs_weapon_1.range = 0
    else
      self.mobility = false
    end
  end

end


