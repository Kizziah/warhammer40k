require 'spec_helper'

describe ChoasMarineSquad do

  describe 'squad details, info, and rules according to Codex' do
    before(:each) do
      @squad = ChoasMarineSquad.new
    end

    it "should create a base choas marine squad" do
      @squad.points.should == 75
      @squad.squad_size.should == 5
    end

    it "should add troops and points" do
      @squad.add_troop(2)
      @squad.flatten.length.should == 7
      @squad.points.should == 101
    end

    it "should allow a max of 15 troops to be added totaling 20 troops" do
      @squad.add_troop(300)
      @squad.flatten.length.should == 20
      @squad.points.should == 270
    end

    it "should add meltagun to basic squad and reflect meltagun's points" do
      @squad.add_weapon(Weapon.send(:meltagun))
      @squad.points == 85
    end

    it "should only allow 1 gunny if squad length is less then 10" do
      @squad.add_troop(3)
      @squad.flatten.length.should == 8
      @squad.add_weapon(Weapon.send(:meltagun))
      @squad.add_weapon(Weapon.send(:meltagun))
      @squad.gunny.length.should == 1
      @squad.points.should == 124
    end

    it "should not be allowed to add a lascannon to a basic squad" do
      @squad.add_weapon(Weapon.send(:lascannon))
      @squad.points.should == 75
      @squad.gunny.length.should == 0
    end

    it "should allowed to add a lascannon to a 12 man squad" do
      @squad.add_troop(7)
      @squad.add_weapon(Weapon.send(:lascannon))
      @squad.points.should == 186
      @squad.gunny.length.should == 1
    end

    it "should allow 2 gunnys if squad length is 10 or larger, one with a lascannon" do
      @squad.add_troop(7)
      @squad.add_weapon(Weapon.send(:meltagun))
      @squad.add_weapon(Weapon.send(:lascannon))
      @squad.points.should == 196
    end

    it "should ignore 1 lascannon because squad is only allowed 1 lascannon" do
      @squad.add_troop(7)
      @squad.add_weapon(Weapon.send(:lascannon))
      @squad.add_weapon(Weapon.send(:lascannon))
      @squad.points.should == 186
      @squad.gunny.length.should == 1
      @squad.flatten.length.should == 12
    end

    it "should ignore second lascannon, but accept meltagun" do
      @squad.add_troop(7)
      @squad.add_weapon(Weapon.send(:lascannon))
      @squad.add_weapon(Weapon.send(:lascannon))
      @squad.add_weapon(Weapon.send(:meltagun))
      @squad.points.should == 196
      @squad.gunny.length.should == 2
      @squad.flatten.length.should == 12
    end
  end

end
