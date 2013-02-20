class Dice

  def self.roll
    1 + rand(6)
  end

  def self.roll_2dice
    Dice.roll + Dice.roll
  end
end
