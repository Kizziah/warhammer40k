require 'spec_helper'

describe HavocSquad do

  describe 'squad details, info, and rules according to Codex' do
    before(:each) do
      @havoc_squad = HavocSquad.new
    end

    it "should create base havoc squad" do
      @havoc_squad.points.should == 75
      @havoc_squad.flatten.length.should == 5
    end

    it "should add a max of 5 troop at 13 points each" do
      @havoc_squad.add_troop(8)
      @havoc_squad.points.should == 140
    end

    it "should add a max of 4 heavy weapons" do
      @havoc_squad.add_troop
      @havoc_squad.add_weapon(Weapon.send(:lascannon))
      @havoc_squad.add_weapon(Weapon.send(:lascannon))
      @havoc_squad.add_weapon(Weapon.send(:lascannon))
      @havoc_squad.add_weapon(Weapon.send(:lascannon))
      @havoc_squad.add_weapon(Weapon.send(:lascannon))
      @havoc_squad.points.should == 168
    end

    it "should allow to change heavy weapons while adjusting squad points accordingly" do
      @havoc_squad.add_weapon(Weapon.send(:lascannon))
      @havoc_squad.add_weapon(Weapon.send(:lascannon))
      @havoc_squad.add_weapon(Weapon.send(:lascannon))
      @havoc_squad.add_weapon(Weapon.send(:lascannon))
      @havoc_squad.change_weapon(Weapon.send(:meltagun), Weapon.send(:lascannon))
      @havoc_squad.points.should == 145
    end

    it "should allow to change heavy weapons while adjusting squad points accordingly" do
      @havoc_squad.add_weapon(Weapon.send(:meltagun))
      @havoc_squad.add_weapon(Weapon.send(:meltagun))
      @havoc_squad.add_weapon(Weapon.send(:meltagun))
      @havoc_squad.add_weapon(Weapon.send(:meltagun))
      @havoc_squad.change_weapon(Weapon.send(:lascannon), Weapon.send(:meltagun))
      @havoc_squad.points.should == 125
    end

    it "should not allow a delfgun to be added; also not add its points to the squad" do
      @havoc_squad.add_weapon(Weapon.send(:meltagun))
      @havoc_squad.add_weapon(Weapon.send(:meltagun))
      @havoc_squad.add_weapon(Weapon.send(:delfgun))
      @havoc_squad.points.should == 95
    end

    it "should not allow a delfgun to be exchanged for a current heavy weapon; also not add its points to the squad" do
      @havoc_squad.add_weapon(Weapon.send(:meltagun))
      @havoc_squad.add_weapon(Weapon.send(:meltagun))
      @havoc_squad.change_weapon(Weapon.send(:delfgun), Weapon.send(:meltagun))
      @havoc_squad.points.should == 95
    end

    it "should not exchange a weapon that a troop isn't armed with" do
      @havoc_squad.add_weapon(Weapon.send(:meltagun))
      @havoc_squad.add_weapon(Weapon.send(:meltagun))
      @havoc_squad.change_weapon(Weapon.send(:meltagun), Weapon.send(:lascannon))
      @havoc_squad.points.should == 95
    end

    it "should exchange multiple weapons and reflect the right points" do
      @havoc_squad.add_weapon(Weapon.send(:lascannon))
      @havoc_squad.add_weapon(Weapon.send(:heavybolter))
      @havoc_squad.add_weapon(Weapon.send(:meltagun))
      @havoc_squad.add_weapon(Weapon.send(:lascannon))
      @havoc_squad.change_weapon(Weapon.send(:meltagun), Weapon.send(:lascannon))
      @havoc_squad.change_weapon(Weapon.send(:meltagun), Weapon.send(:lascannon))
      @havoc_squad.change_weapon(Weapon.send(:lascannon ), Weapon.send(:meltagun))
      @havoc_squad.points.should == 125
    end
  end

end
