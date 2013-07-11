class FenrisianWolf < Troop

  def self.create(stats = {})
    new(
      :type =>stats[:type] || :beast,
      :ws => stats[:ws] || 4,
      :bs => stats[:bs] || 0,
      :s =>  stats[:bs] || 4,
      :t => stats[:t]   || 4,
      :w => stats[:w]   || 1,
      :a => stats[:a]   || 2,
      :i => stats[:i]   || 4,
      :ld => stats[:ld] || 5,
      :save => stats[:save] || 6,
      :autosave => stats[:autosave] || 0,
      :ws_weapon => stats[:ws_weapon] || Weapon.knive,
      :points => stats[:points] || 8

      )
  end
end
