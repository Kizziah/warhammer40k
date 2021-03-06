class Shot
 # raise "UNVALID" unless shot_invalid?
 # WOUND = shooter_rolls = {hit_roll:}
  $results = []

  attr_reader :result, :hit_roll, :strength_roll, :armor_roll, :autosave_roll, :bs,
              :target, :weapon, :shooter, :rolls

  def initialize(shooter, target, shooter_rolls = {})
    @rolls = shooter_rolls
    @hit_roll = shooter_rolls[:hit] || Dice.roll
    @strength_roll = shooter_rolls[:strength] || Dice.roll
    @armor_roll = shooter_rolls[:armor] || Dice.roll
    @autosave_roll = shooter_rolls[:autosave] || Dice.roll
    @target = target
    @shooter = shooter
    @weapon = shooter.bs_weapon
    @bs = @shooter.bs
    @result = result
    hit_test
  end

  def print_result
    puts @result
  end

  def print_rolls
    [:hit_roll, :strength_roll, :armor_roll, :autosave_roll].each do |roll|
      puts "#{roll}: #{self.send(roll)}"
    end
  end

  private

  def hit_test
    if hit_target?
      ShootVehicle.new(shooter, target, rolls) if target.type == :vehicle #|| target.type :walker
      strength_test if target.type == :troop
    else
      miss
    end
  end

  def reroll_hit
    Shot.new(shooter, target)
  end

  def strength_test
    if strength_sufficient?
      ap_test
    else
      @result = :SvsT
      $results << @result
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
    if armor_roll >= target.save
      @result = :ARMOR
      $results << @result
    else
      have_autosave
    end
  end

  def have_autosave
   if target.has_autosave?
    autosave_test
   else
    wound
   end
  end

  def autosave_test
    if autosave_roll >= target.autosave
      @result = :AUTOSAVE
      $results << @result
    else
      wound
    end
  end

  def distance
    shooter.x_location - target.x_location
  end

  def out_of_range?
    distance > weapon.range
  end

  def invalid_target?
    target.in_combat?
  end

  def miss
    @result = :miss
    $results << @result
    GetsHot.new(shooter) if hit_roll == 1 && @weapon.special == 'getshot'
    # reroll_hit if @weapon.special == 'twinlinked' && @twinlinked == nil #TODO fix twinlinked so it allows misses
  end
  
  def wound
    target.wound
    @result = :WOUND
    $results << @result
  end

  def run_armor_test?
    weapon.ap > target.save
  end

  def hit_target?
    roll_needed = case bs
    when 5 then 2
    when 4 then 3
    when 3 then 4
    when 2 then 5
    when 1 then 6
    end
    hit_roll >= roll_needed
  end

  def strength_sufficient?
    roll_needed = case weapon.strength - target.t
    when 0 then  4
    when 1 then 3
    when 2 then 2
    when 3 then 2
    when 4 then 2
    when 5 then 2
    when 6 then 2
    when -1 then 5
    when -2 then 6
    when -3 then 6
    end
    strength_roll >= roll_needed
  end
end
