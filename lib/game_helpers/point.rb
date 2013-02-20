class Point

  def self.squad_count(squad)
    point = 0
      squad.each do |squad|
      point += squad.points
    end
    return point
  end

  def self.army_count(army)
    point = 0
    army.each do |m|
      m.each do |squad|
      point += squad.points
      end
    end
    return point
  end
end
