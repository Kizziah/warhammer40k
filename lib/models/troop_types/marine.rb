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

class MarineSergeant
  def self.create
    Marine.create(:ld => 9, :a => 2, :bs_weapon => @@boltpistol, :ws_weapon => @@chainsword)
  end
end

class ChoasMarine < Marine
  def self.create
    Marine.create(:points => 13)
  end
end

class KhorneBerzerker
  def self.create
    Marine.create(:points => 19, :ws => 5, :bs_weapon => @@boltpistol, :ws_weapon => @@chainsword)
  end
end

class PlagueMarine < Marine
  def self.create
    Marine.create(:t => 5)
  end
end

class ThousandSon < Marine
  def self.create
    Marine.create(:bs_weapon => @@infernoboltgun, :autosave => 4, :ld => 10, :points => 23)
  end
end

class ThousandSonSocerer
  def self.create
    Marine.create(:a => 2, :bs_weapon => @@infernoboltgun, :ws_weapon => @@powersword, :autosave => 4, :ld => 10)
  end
end
