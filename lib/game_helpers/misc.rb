def determine_first_turn
  marine_roll = Dice.roll
  choas_roll =  Dice.roll
  puts "Choas Roll #{choas_roll} vs Marine Roll #{marine_roll} "
  until marine_roll != choas_roll
    marine_roll = Dice.roll
    choas_roll =  Dice.roll
   puts "Reroll for first turn"
   puts "Choas Roll #{choas_roll} vs Marine Roll #{marine_roll} "
  end
  turn(choas_army, marine_army) if choas_roll > marine_roll
  turn(marine_army, choas_army) if choas_roll < marine_roll
end

def display(string)
  puts(string) unless $test_mode
end

def determine_winner
  puts 'Choas Victory' if marine_army.wiped?
  puts 'Marine Victory' if choas_army.wiped?
end

def run_credits
  puts "GAME DESIGNER MICHAEL DAVIS"
  puts "THANKS TO GAME WORKSHOP"
  exit
end


class Game

  attr_accessor :board, :marine_army, :choas_army, :all_squads, :over, :active_army, :nonactive_army

  def initialize
    @board = create_board
    @all_squads = CreateArmies.new
    @marine_army = create_marine_army
    @choas_army = create_choas_army
  end

  def turn(active_army, nonactive_army)
    puts active_army.type.to_s + 's Turn'
    active_army.each {|squad| squad.moved = false }
    MovementPhase.new(board, active_army, nonactive_army)
    active_army.each {|squad| squad.fired = false }
    ShootingPhase.new(board, active_army, nonactive_army)
    # AssaultPhase.new
    switch_turn(nonactive_army, active_army) #unless game_over?
  end

  def create_marine_army
    ultra = board.place_troop(all_squads.ultramarine_squad, 1, 8)
    blood = board.place_troop(all_squads.bloodmarine_squad, 2, 11)
    ultramarine_squad = ultra.occupant
    bloodmarine_squad = blood.occupant
    marine_army = Army.new('Marine')
    marine_army << ultramarine_squad << bloodmarine_squad
  end

  def create_choas_army
    havoc = board.place_troop(all_squads.havoc_squad, 2, 2)
    cultist = board.place_troop(all_squads.cultist_squad, 4, 4)
    havoc_squad = havoc.occupant
    cultist_squad = cultist.occupant
    choas_army = Army.new('Choas')
    choas_army << havoc_squad << cultist_squad
  end

  def switch_turn(active_army, nonactive_army)
    turn(active_army, nonactive_army)
  end

  def create_board
    Board.new(40, 40)
  end

  def game_over?
    marine_army.wiped? || choas_army.wiped?
    determine_winner
  end
end
