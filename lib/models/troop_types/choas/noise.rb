class NoiseMarine < Troop

  def self.create(stats = {})
    new(
      :ws => stats[:ws] || 4,
      :bs => stats[:bs] || 4,
      :s =>  stats[:bs] || 4,
      :t => stats[:t]   || 4,
      :w => stats[:w]   || 1,
      :a => stats[:a]   || 1,
      :i => stats[:i]   || 5,
      :ld => stats[:ld] || 8,
      :save => stats[:save] || 3,
      :autosave => stats[:autosave] || 0,
      :bs_weapon => stats[:bs_weapon] || Weapon.boltpistol,
      :ws_weapon => stats[:ws_weapon] || Weapon.knive,
      :points => stats[:points] || 13
    )
  end

end
