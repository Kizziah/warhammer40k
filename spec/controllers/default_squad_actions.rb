require 'spec_helper'

describe DefaultSquad do

    before(:each) do
      @choas_squad = ChoasMarineSquad.new
      @thousandson_squad = ThousandSonSquad.new
      @havoc = HavocSquad.new
    end

    it "squad should shoot and kill troops from other squad" do
      $results.clear
      before_shooting = @thousandson_squad.squad_size
      wound = 0
      @havoc.shoot(@thousandson_squad)
      $results.select {|result| wound += 1 if result == :WOUND }
      @thousandson_squad.squad_size.should == before_shooting - wound
    end

    it "should add troop to squad and behave properly" do
      @thousandson_squad.add_troop
      @thousandson_squad.add_troop
      $results.clear
      before_shooting = @thousandson_squad.squad_size
      wound = 0
      @havoc.shoot(@thousandson_squad)
      $results.select {|result| wound += 1 if result == :WOUND }
      @thousandson_squad.squad_size.should == before_shooting - wound
    end

    it "should add troop to squad and behave properly" do
      @choas_squad.add_troop
      $results.clear
      before_shooting = @choas_squad.squad_size
      wound = 0
      @havoc.shoot(@choas_squad)
      $results.select {|result| wound += 1 if result == :WOUND }
      @choas_squad.squad_size.should == before_shooting - wound
    end

    it "should add troop to squad and behave properly" do
      @choas_squad.add_troop
      $results.clear
      before_shooting = @havoc.squad_size
      wound = 0
      @choas_squad.shoot(@havoc)
      $results.select {|result| wound += 1 if result == :WOUND }
      @havoc.squad_size.should == before_shooting - wound
    end

end
