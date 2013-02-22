class Vechicle

  attr_accessor :bs, :front_armour, :back_armour, :side_armour, :crew, :wrecked,
                :hp, :bs_weapon_1, :bs_weapon_2, :bs_weapon_3, :mobility, :type,
                :coordinates, :tile

  def initialize(stats = {})
    @type = stats[:type]
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
  end

  def vechicle_armor_test(side_tested)
   vechicle_damage_chart if self.side_tested < peneration_roll
   self.hp - 1 if side_tested == peneration_roll
  end

  def wrecked?
    self.hp == 0
  end

  def peneration_roll
    weapon.ap + Dice.roll
  end

  def ap_bonus
    1 if weapon.ap == 2
    2 if weapon.ap == 1
  end

  def vechicle_damage_chart
    chart_result = case Dice.roll + ap_bonus
    when 1 then crew_shaken
    when 2 then crew_shaken
    when 3 then crew_stunned
    when 4 then weapon_destroyed
    when 5 then immombilised
    when 6 then explodes
    when 7 then explodes
    when 8 then explodes
    end
  end

  def crew_shaken?
    self.crew_shaken == true
  end

  def crew_stunned?
    self.crew == 'stunned'
  end

  def glancing_hit
    self.hp - 1
  end

  def weapon_destroyed
    roll = Dice.roll
    bs_weapon_1.range = 0 if roll == 1 || roll == 2
    bs_weapon_2.range = 0 if roll == 3 || roll == 4
    bs_weapon_3.range = 0 if roll == 5 || roll == 6
  end

  def immobilised?
    self.mobility == false
  end


end
