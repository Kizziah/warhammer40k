class Cultist < Troop

  def self.create(stats = {})
    new(
    :ws => stats[:ws] || 3,
    :bs => stats[:bs] || 3,
    :s =>  stats[:bs] || 3,
    :t => stats[:t]   || 3,
    :w => stats[:w]   || 1,
    :a => stats[:a]   || 1,
    :i => stats[:i]   || 3,
    :ld => stats[:ld] || 7,
    :save => stats[:save] || 6,
    :autosave => stats[:autosave] || 0,
    :bs_weapon => stats[:bs_weapon] || Weapon.new(16, 3, 7, 1, "autopistol"),
    :ws_weapon => stats[:ws_weapon] || Weapon.new(0, 3, 7, 1, "knive"),
    :points => stats[:points] || 5
  )
  end

  def new
    Cultist.create
  end

end

class CultistSergeant < Cultist

  def self.create
    Cultist.create(:ld => 7, :a => 2)
  end
end
