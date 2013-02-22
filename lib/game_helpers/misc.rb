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
