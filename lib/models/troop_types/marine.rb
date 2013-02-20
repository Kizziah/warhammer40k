class Marine < Troop

  def initialize(stat = {})
    @ws = stat[:ws] || 4
    @bs = stat[:bs] || 4
    @s =  stat[:bs] || 4
    @t = stat[:t]   || 4
    @w = stat[:w]   || 1
    @a = stat[:a]   || 1
    @i = stat[:i]   || 4
    @save = stat[:save] || 3
    @autosave = stat[:autosave] || 0
    @bs_weapon = stat[:bs_weapon] || Weapon.new(24, 4, 4, 1, "boltgun")
    @ws_weapon = stat[:ws_weapon] || Weapon.new(0, 4, 7, 1, "knive")
    @points = stat[:points] || 15
  end

  # def initialize(stat = {})
  #   new(
  #     :ws => stat[:ws] || 4,
  #     :bs => stat[:bs] || 4,
  #     :s =>  stat[:bs] || 4,
  #     :t => stat[:t]   || 4,
  #     :w => stat[:w]   || 1,
  #     :a => stat[:a]   || 1,
  #     :i => stat[:i]   || 4,
  #     :save => stat[:save] || 3,
  #     :autosave => stat[:autosave] || 0,
  #     :bs_weapon => stat[:bs_weapon] || Weapon.new(24, 4, 4, 1, "boltgun"),
  #     :ws_weapon => stat[:ws_weapon] || Weapon.new(0, 4, 7, 1, "knive"),
  #     :points => stat[:points] || 15
  #   )
  # end
end

class ThousandSon < Marine
  def initialize
    @bs_weapon = Weapon.new(24, 4, 3, 1, "10Kboltgun")
    @autosave = 4
  end

end

# class PlagueMarine < Marine
#   def self.create
#       Marine.create(:t => 5)
#   end
# end

# class Havoc < Marine
#   def self.create
#     Marine.create(:bs_weapon => Weapon.new(48, 8, 2, 1, "lascannon"))
#   end
# end
