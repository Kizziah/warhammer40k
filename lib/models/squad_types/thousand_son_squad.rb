class ThousandSonSquad < Array

 attr_accessor  :coordinates, :tile, :targetable, :combat, :moved, :option,
                :fired, :assaulted, :troops, :num, :leader, :points, :broken

  attr_reader :faction, :name

  def initialize
    @name = 'Thousand Son'
    @faction = 'Choas'
    4.times { self << ThousandSon.create }
    @leader = ThousandSonSocerer.create
    self << @leader
    @points = 150
  end

  def add_troop(num = {})
    num = 1 if num == {}
    num = 15 if num >= 16
    troop = ThousandSon.create
    num.times { self << ThousandSon.create }
    num.times { @points += troop.points }
  end

end
