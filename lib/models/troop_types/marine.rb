class Marine < Troop

  def initialize(stat = {})
    @type = 'troop'
    @ws =  4
    @bs = 4
    @s = 4
    @t = 4
    @w = 1
    @a = 1
    @i = 4
    @ld = 8
    @save = 3
    @autosave = 0
    @bs_weapon = Weapon.new(24, 4, 4, 1, "boltgun")
    @ws_weapon = Weapon.new(0, 4, 7, 1, "knive")
    @points = 15
  end

  def new
    Marine.new
  end
end

class MarineSergeant < Marine

  def initialize(stat = {})
    @ws =  4
    @bs = 4
    @s = 4
    @t = 4
    @w = 1
    @a = 2
    @i = 4
    @ld = 9
    @save = 3
    @autosave = 0
    @bs_weapon = Weapon.new(24, 4, 4, 1, "boltpistol")
    @ws_weapon = Weapon.new(0, 4, 7, 1, "chainsword")
    @points = 15
  end

  def new
    MarineSergeant.new
  end
end

class ThousandSon < Marine
  def initialize(stat = {})
    @type = 'troop'
    @ws = 4
    @bs = 4
    @s = 4
    @t = 4
    @w = 1
    @a = 1
    @i = 4
    @ld = 8
    @save = 3
    @autosave = 4
    @bs_weapon = Weapon.new(24, 4, 3, 1, "10Kboltgun")
    @ws_weapon = Weapon.new(0, 4, 7, 1, "knive")
    @points = 15
  end
end

class PlagueMarine < Marine
  def initialize(stat = {})
    @t = 5
  end
end

class Havoc < Marine
  def initialize(stat = {})
    @type = 'troop'
    @ws = 4
    @bs = 4
    @s = 4
    @t = 4
    @w = 1
    @a = 1
    @i = 4
    @ld = 8
    @save = 3
    @autosave = 0
    @bs_weapon = Weapon.new(48, 9, 2, 1, "lascannon")
    @ws_weapon = Weapon.new(0, 4, 7, 1, "knive")
    @points = 15
  end

  def new
    Havoc.new
  end
end
