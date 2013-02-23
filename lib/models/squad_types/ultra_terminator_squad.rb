class UltraTerminatorSquad < Array
attr_accessor :points

  def initialize
    self << Squad.new('marine', 'choas', 1, Terminator.create, 4)
    # self.add_leader(Terminator.create)
  end

    # add_leader Terminator.create(:ws_weapon => Weapon.new(0, 4, 3, 1, "powersword")

end

class TermSquad < Squad
  attr_accessor :squad

  def initialize
    @squad = squad
  end

  def self.create_marine_terminator_squad
    squad = Squad.new('Terminator', 'marine', 1, Terminator.create, 4)
    squad.add_leader(Terminator.create(:ws_weapon => @@powersword))
    squad.points = 200
    squad
  end

end


# squad = TermSquad.create_marine_terminator_squad
# puts squad.length
# squad.add_troop(Terminator.create)
# puts squad.length
# puts squad.points

# squad.equip_bs_weapon(squad.first, @@lascannon)

# squad.each {|troop| troop.bs_weapon.t }
