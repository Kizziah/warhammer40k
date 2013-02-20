require_relative '../40k'

marine_squad = []
choas_squad = []

10.times do
  marine_squad << Marine.create
end

10.times do
  choas_squad << Havoc.create
end

until marine_squad.length == 0 || choas_squad.length == 0
  choas_squad.collect do |choas|
    choas.shoot(marine_squad.last) unless marine_squad.length == 0
    marine_squad.delete_if { |marine| marine.dead? }
  end
  puts marine_squad.length
  marine_squad.collect do |marine|
  marine.shoot(choas_squad.last) unless choas_squad.length == 0
  choas_squad.delete_if { |choas| choas.dead? }
  end
  puts choas_squad.length
end

if marine_squad.length == 0
  puts "Choas Win"
else
  puts "Marine Win"
end
