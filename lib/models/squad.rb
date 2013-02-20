class Squad < Array

  attr_accessor :coordinates, :tile, :targetable, :combat, :moved, :option, :fired, :assaulted, :troops
  attr_reader :faction, :name

  def initialize(name, faction, option)
    @name = name
    @faction = faction
    @option = option
  end

  def drop_dead_troops
    self.delete_if { |troop| troop.dead? }
  end

  def out_of_range?(target)
    distance(self.tile.x, self.tile.y, target.tile.x, target.tile.y) > self.last.bs_weapon.range
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

  def wiped?
    self.length == 0
  end
end
