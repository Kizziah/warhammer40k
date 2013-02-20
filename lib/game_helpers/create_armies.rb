class CreateArmies

  attr_accessor :havoc_squad, :cultist_squad, :ultramarine_squad,
              :bloodmarine_squad

  def initialize
    create_squads
  end

  def create_squads
    @havoc_squad = Squad.new('Havoc', 'choas', 1)
    @cultist_squad = Squad.new('Cultist', 'choas', 2)
    @ultramarine_squad = Squad.new('Ultramarine', 'marine', 1)
    @bloodmarine_squad = Squad.new('Bloodmarine', 'marine', 2)

    10.times { @cultist_squad << Cultist.create }
    15.times { @havoc_squad << Havoc.create }
    3.times { @ultramarine_squad << Marine.create }
    3.times { @bloodmarine_squad << Marine.create }
  end

end
