class NilTroop < Troop
  attr_accessor :bs_weapon, :tile, :coordinates, :type

  def initialize(stat = {})
    @type = 'troop'
    @ws = 1
    @bs = 1
    @s = 1
    @t = 1
    @w = 1
    @a = 1
    @i = 1
    @ld = 1
    @save = 7
    @autosave = 0
    @points = 0
  end

end
