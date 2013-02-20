class MovementPhase

  attr_accessor :board, :active_army, :nonactive_army

  MaxMovement = 6

  def initialize(board, active_army, nonactive_army)
    @board = board
    @active_army = active_army
    @nonactive_army = nonactive_army
    start_movement_phase
  end

  def start_movement_phase
    movement_intro
    active_army.each { |squad| puts squad.name.to_s + ' squad ' + squad.option.to_s unless squad.wiped? || squad.moved == 'yes'}
    squad_reply = gets.chomp
    num = squad_reply.to_i
    active_army.each { |squad| move_squads_x_y_coordinates(squad, active_army) if squad.option == num unless squad.wiped? || squad.moved == 'yes' }
  end

  def move_squads_x_y_coordinates(squad, army)
    current_tile = squad.tile
    puts 'Move ' + squad.name.to_s + ' squad'
    puts 'Current spot x ' + current_tile.x.to_s + ' y ' + current_tile.y.to_s
    puts 'plot x coordinate'
    reply_x = gets.chomp
    reply_x.to_i
    puts 'plot y coordinate'
    reply_y = gets.chomp
    reply_y.to_i

    if distance_tile(current_tile, board.find_tile(reply_x.to_i, reply_y.to_i)) <= MaxMovement
      puts "Squad can only move 6 inches, please move troop to valid tile."
      move_squads_x_y_coordinates(squad, army)
    else
      move_squad(squad, reply_x.to_i, reply_y.to_i, army)
    end
  end

  def move_squad(squad, x, y, army)
    board.place_troop(squad, x, y)
    squad.moved = 'yes'
    army.collect {|squads|
    start_movement_phase(army) unless squads.moved == 'yes' }
  end

  def movement_intro
    puts 'Movement Phase... Choose a squad to move (press number for squad)'
  end
end
