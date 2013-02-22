class Terminator < Troop

  def self.create(stat = {})
    new(
      :ws => stat[:ws] || 4,
      :bs => stat[:bs] || 4,
      :s =>  stat[:bs] || 4,
      :t => stat[:t]   || 4,
      :w => stat[:w]   || 1,
      :a => stat[:a]   || 2,
      :save => stat[:save] || 2,
      :autosave => stat[:autosave] || 5,
      :bs_weapon => stat[:bs_weapon] || @@stormbolter,
      :ws_weapon => stat[:ws_weapon] || Weapon.new(0, 8, 2, 1, 'powerfist')
    )
  end

  def new
    Terminator.create
  end
end


class ChoasTerminator < Troop

  def self.create
    Terminator.create
  end

  def new
    Terminator.create
  end

end
