class Troop
  attr_accessor :name, :ws, :bs, :s, :t, :w, :a, :save, :autosave, :i, :ld, :shoot, :bs_weapon,
                :ws_weapon, :combat, :cover_save, :coordinates, :points, :tile, :type, :result

  def initialize(stats = {})
    @name = stats[:name]
    @ws = stats[:ws]
    @bs = stats[:bs]
    @s = stats[:s]
    @t = stats[:t]
    @w = stats[:w]
    @a = stats[:a]
    @i = stats[:i]
    @ld = stats[:ld]
    @save = stats[:save]
    @autosave = stats[:autosave]
    @bs_weapon = stats[:bs_weapon]
    @ws_weapon = stats[:ws_weapon]
    @points = stats [:points]
    @type = stats [:type] || 'troop'
  end

  def shoot(target, shoot_rolls = {})
   self.bs_weapon.use(self, target, shoot_rolls)
  end

  def assault(target, attack_rolls = {}, defend_rolls = {})
    Combat.new(self, target, attack_rolls, defend_rolls)
  end

  def move_south(map)
    map.move_south(self)
  end

  def move_north(map)
    map.move_north(self)
  end

  def move_east(map)
    map.move_east(self)
  end

  def move_west(map)
    map.move_west(self)
  end

  def dead?
    self.w == 0
  end

  def new_bs_weapon(weapon)
    self.bs_weapon = weapon
  end

  def out_of_range?(target)
    distance(self.tile.x, self.tile.y, target.tile.x, target.tile.y) > bs_weapon.range
  end

  def within_range?(target)
    distance(self.tile.x, self.tile.y, target.tile.x, target.tile.y) < bs_weapon.range
  end

  def in_combat?
    combat == true
  end

  def has_autosave?
    autosave >= 1
  end

  def attacked
   self.a -= 1
  end

  def wound(amount = 1)
    self.w -= amount
  end
end
