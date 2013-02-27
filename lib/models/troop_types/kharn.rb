class Kharn < Troop

  def self.create(stats = {})
    new(
      :ws => stats[:ws] || 7,
      :bs => stats[:bs] || 5,
      :s =>  stats[:bs] || 5,
      :t => stats[:t]   || 4,
      :w => stats[:w]   || 3,
      :a => stats[:a]   || 4,
      :i => stats[:i]   || 5,
      :ld => stats[:ld] || 10,
      :save => stats[:save] || 3,
      :autosave => stats[:autosave] || 5,
      :bs_weapon => stats[:bs_weapon] || @@plasmapistol,
      :ws_weapon => stats[:ws_weapon] || Weapon.new(0, 4, 7, 1, "knive"),
      :points => stats[:points] || 160
    )
  end
end
