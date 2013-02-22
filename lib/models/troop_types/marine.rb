class Marine < Troop

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
      :bs_weapon => stats[:bs_weapon] || @@boltgun,
      :ws_weapon => stats[:ws_weapon] || Weapon.new(0, 4, 7, 1, "knive"),
      :points => stats[:points] || 15
    )
  end

  def new
    Marine.create
  end

end

class ThousandSon < Marine
  def self.create
    Marine.create(:bs_weapon => Weapon.new(24, 4, 3, 1, 'dasf'), :autosave => 4, :ld => 10)
  end

  def new
    ThousandSon.create
  end

end

class PlagueMarine < Marine
  def self.create
    Marine.create(:t => 5)
  end

  def new
    PlagueMarine.create
  end
end

class Havoc < Marine
  def self.create
    Marine.create(:bs_weapon => @@lascannon)
  end

  def new
    Havoc.create
  end
end
