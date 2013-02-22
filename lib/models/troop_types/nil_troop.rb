class NilTroop < Troop
  attr_accessor :bs_weapon, :tile, :coordinates, :type

  def initialize(stat = {})
    @tile
    @type = 'blast'
  end

end
