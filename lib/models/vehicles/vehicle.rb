class Vehicle

  attr_accessor :bs, :front_armour, :back_armour, :side_armour, :crew, :wrecked,
                :hp, :bs_weapon_1, :bs_weapon_2, :bs_weapon_3, :mobility, :type,
                :coordinates, :tile

  def initialize(stats = {})
    @type = :vehicle
    @crew = stats[:crew]
    @bs = stats[:bs]
    @front_armour = stats[:front_armour]
    @back_armour = stats[:back_armour]
    @side_armour = stats[:side_armour]
    @hp = stats[:hp]
    @bs_weapon_1 = stats[:bs_weapon_1]
    @bs_weapon_2 = stats[:bs_weapon_2]
    @bs_weapon_3 = stats[:bs_weapon_3]
    @transport_capacity = stats[:trasport_capacity]

    assign_crew_weapons
  end

  def wrecked?
    self.hp == 0
  end

  def crew_shaken?
    self.crew_shaken == true
  end

  def crew_stunned?
    self.crew == :stunned
  end

  def immobilised?
    self.mobility == false
  end
end
