class CreateArmies

  attr_accessor :havoc_squad, :cultist_squad, :ultramarine_squad,
                :bloodmarine_squad

  def initialize
    create_squads
  end

  def create_squads
    @havoc_squad = Squad.new('Havoc', 'choas', 1, Havoc.new, 5, )
    @cultist_squad = Squad.new('Cultist', 'choas', 2, Cultist.new, 10 )
    @ultramarine_squad = Squad.new('Ultramarine', 'marine', 1, Marine.new, 5 )
    @bloodmarine_squad = Squad.new('Bloodmarine', 'marine', 2, Marine.new, 5 )
  end
end

