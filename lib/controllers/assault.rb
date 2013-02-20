class Assault

  attr_accessor :result, :hit_roll, :strength_roll, :armor_roll, :autosave_roll, :ws,
                :weapon, :defender, :d_ws, :attacker

  def initialize(attacker, defender, roles = {})
    @hit_roll = roles[:hit] || Dice.roll
    @strength_roll = roles[:strength] || Dice.roll
    @armor_roll = roles[:armor] || Dice.roll
    @autosave_roll = roles[:autosave] || Dice.roll
    @defender = defender
    @attacker = attacker
    @weapon = attacker.ws_weapon
    @ws = attacker.ws
    @d_ws = defender.ws
    attack
  end

  def print_rolls
    [:hit_roll, :strength_roll, :armor_roll, :autosave_roll].each do |roll|
      puts "#{roll}: #{self.send(roll)}"
    end
  end

  private

  def attack
    until attacker.a == 0 || defender.dead?
    attacker.attacked
    hit_test
    end
  end

  def hit_test
    if hit_defender?
      strength_test
    else
      miss
    end
  end

  def strength_test
    if strength_sufficient?
      ap_test
    else
      @result = "SvsT"
    end
  end

  def ap_test
    if run_armor_test?
     armor_test
    else
      have_autosave
    end
  end

  def armor_test
    if armor_roll >= defender.save
      @result = "ARMOR"
    else
      have_autosave
    end
  end

  def have_autosave
   if defender.has_autosave?
    autosave_test
   else
    wound
   end
  end

  def autosave_test
    if autosave_roll >= defender.autosave
      @result = "AUTOSAVE"
    else
      wound
    end
  end

 #-------------Logic------------------------------------------------------------------------------

  def miss
    @result = "miss"
  end

  def wound
    defender.wound
  end

  def run_armor_test?
    weapon.ap > defender.save
  end

  def hit_defender?
    roll_needed = case ws - d_ws
    when 0 then 4
    when 1 then 4
    when 2 then 4
    when -1 then 3
    when -2 then 3
    end
    hit_roll >= roll_needed
  end

  def strength_sufficient?
    roll_needed = case weapon.strength - defender.t
    when 0 then 4
    when 1 then 3
    when 2 then 2
    when 3 then 2
    when 4 then 2
    when 5 then 2
    when -1 then 5
    when -2 then 6
    end
    strength_roll >= roll_needed
  end
end
