class Loota < Troop

  def self.create(stat = {})
    new(
      :ws => stat[:ws] || 4,
      :bs => stat[:bs] || 2,
      :s =>  stat[:bs] || 3,
      :t => stat[:t]   || 4,
      :w => stat[:w]   || 1,
      :a => stat[:a]   || 3,
      :i => stat[:i]   || 3,
      :save => stat[:save] || 6,
      :autosave => stat[:autosave] || 0,
      :bs_weapon => stat[:bs_weapon] || Weapon.delfgun,
      :ws_weapon => stat[:ws_weapon] || Weapon.knive,
      :points => stat[:points] || 15
    )
  end

end
