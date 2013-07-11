class LongFang < Troop

  def self.create(stats = {})
    new(
      :ws => stats[:ws] || 4,
      :bs => stats[:bs] || 4,
      :s =>  stats[:bs] || 4,
      :t => stats[:t]   || 4,
      :w => stats[:w]   || 1,
      :a => stats[:a]   || 1,
      :i => stats[:i]   || 4,
      :ld => stats[:ld] || 8,
      :save => stats[:save] || 3,
      :autosave => stats[:autosave] || 0,
      :bs_weapon => stats[:bs_weapon] || Weapon.multimelta,
      :ws_weapon => stats[:ws_weapon] || Weapon.knive,
      :points => stats[:points] || 15

    )
  end
end


class LongFangSquad

  def weapons_allowed?
    [ :heavybotler, :krakmissle, :plasmacannon, :lascannon, :multimelta ]
  end

  def sergeant_weapons_allowed?
    [ :powerfist, :plasma_pistol, :powersword, :meltagun, :flamer]
  end

  def add_weapon_points
    self.points += case weapon.type
    when :lascannon then 25
    when :plasmacannon then 20
    when :multimelta, :krakmissle then 10
    when :heavybotler then 5
    end
  end

  def sergeant_weapon_points

    self.points += case weapon.type
    when :powerfist then 25
    when :plasma_pistol :plasma_gun, :powersword then 15
    when :meltagun  then 10
    when :flamer then 5
    end

  end

end
