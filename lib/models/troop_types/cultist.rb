class Cultist < Troop

  def self.create(stat = {})
    new(
      :ws => stat[:ws] || 3,
      :bs => stat[:bs] || 3,
      :s =>  stat[:bs] || 3,
      :t => stat[:t]   || 3,
      :w => stat[:w]   || 1,
      :a => stat[:a]   || 1,
      :i => stat[:i]   || 3,
      :save => stat[:save] || 6,
      :autosave => stat[:autosave] || 0,
      :bs_weapon => stat[:bs_weapon] || Weapon.new(16, 3, 7, 1, "autopistol"),
      :ws_weapon => stat[:ws_weapon] || Weapon.new(0, 3, 7, 1, "knive"),
      :points => stat[:points] || 5
    )
  end
end