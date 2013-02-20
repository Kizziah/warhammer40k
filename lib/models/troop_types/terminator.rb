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
      :autosave => stat[:autosave] || 5
    )
  end
end