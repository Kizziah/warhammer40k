class ShootingPhase

  attr_accessor :board, :active_army, :nonactive_army

  def initialize(board, active_army, nonactive_army)
    @board = board
    @active_army = active_army
    @nonactive_army = nonactive_army
    start_shooting_phase(active_army, nonactive_army)
  end

  def start_shooting_phase(army, army2)
    puts 'Shooting Phase... Choose a squad (press number for squad)' unless army.length == 0
    puts
    army.each { |squad| puts squad.name.to_s + ' squad ' + squad.option.to_s unless invalid_shooting_options?(squad) }
    squad_reply = gets.chomp
    num = squad_reply.to_i
    army.each { |squad| set_valid_targets(squad, army2) if squad.option == num }
  end

  def set_valid_targets(shooter, targets)
    targets.each { |target| target.targetable = false }
    targets.each { |target| target.targetable = true unless shooter.out_of_range?(target)  || target.wiped? }
    choose_squad_to_shoot(shooter, targets)
  end

  def choose_squad_to_shoot(shooter, targets)
    shooter.fired = true
    puts "#{shooter.name.to_s} can shoot the following enemy squads: "
    targets.each { |target| puts target.name.to_s + ' squad ' + target.option.to_s + ': ' +  target.name.to_s + 's are ' + distance_tile(shooter.tile, target.tile).to_s + ' inches away' if target.targetable == true }
    puts 'Which squad would you like to shoot (press number for squad)'
    reply_shoot = gets.chomp
    num = reply_shoot.to_i
    targets.each { |target| squad_shoot(shooter, target) if target.option == num unless invalid_shooting_options(target) }
  end

  def squad_shoot(shooter, targets)
    start = targets.length
    shooter.collect {|troop| troop.shoot(targets.last) unless targets.wiped?
    targets.delete_if {|target| target.dead?} }
    troops_killed = start - targets.length
    puts troops_killed.to_s + ' ' + targets.name +  ' were killed.'
    puts targets.length.to_s + ' ' + targets.name + ' remain.'
    active_army.each {|squad|
    nonactive_army.drop_wiped_squads
    start_shooting_phase(active_army, nonactive_army) unless squad.fired?(squad)}
  end

  def invalid_shooting_options?(squad)
    squad.fired? || squad.wiped?  || squad.targetable == false
  end
end
