require 'spec_helper'

describe UltraTerminatorSquad do

  describe 'squad details, info, and rules according to Codex' do
    before(:each) do
      @squad = UltraTerminatorSquad.new
    end

    it "should create a basic Ultra Mairne Terminator Squad" do
      @squad.squad_size.should == 5
      @squad.points.should == 200
    end

    it "should add only one special weapon per 5 troops in the squad" do
      @squad.add_weapon(Weapon.assault_cannon)
      @squad.points.should == 230
      @squad.gunny.length.should == 1
      @squad.squad_size.should == 5
    end

    it "should only allow 1 special weapon to be added unless squad size is 10" do
      @squad.add_weapon(Weapon.assault_cannon)
      @squad.add_weapon(Weapon.assault_cannon)
      @squad.points.should == 230
      @squad.gunny.length.should == 1
      @squad.squad_size.should == 5
    end

    it "should only allow 1 special weapon to be squad size is 10" do
      @squad.add_troop(5)
      @squad.add_weapon(Weapon.assault_cannon)
      @squad.points.should == 430
      @squad.gunny.length.should == 1
      @squad.squad_size.should == 10
    end

    it "should only allow 2 special weapon to be squad size is 10" do
      @squad.add_troop(5)
      @squad.add_weapon(Weapon.assault_cannon)
      @squad.add_weapon(Weapon.assault_cannon)
      @squad.points.should == 460
      @squad.gunny.length.should == 2
      @squad.squad_size.should == 10
    end

    it "should only allow 2 special weapon to be squad size is 10, a request for a third will be ignored" do
      @squad.add_troop(5)
      @squad.add_weapon(Weapon.assault_cannon)
      @squad.add_weapon(Weapon.assault_cannon)
      @squad.add_weapon(Weapon.assault_cannon)
      @squad.points.should == 460
      @squad.gunny.length.should == 2
      @squad.squad_size.should == 10
    end

    it "should only allow 2 special weapon to be squad size is 10, a request for a third will be ignored" do
      @squad.add_troop(5)
      @squad.add_weapon(Weapon.assault_cannon)
      @squad.add_weapon(Weapon.heavyflamer)
      @squad.points.should == 435
      @squad.gunny.length.should == 2
      @squad.squad_size.should == 10
    end

    it "should change allowed weapons and adjust points accordingly" do
      @squad.add_weapon(Weapon.assault_cannon)
      @squad.points.should == 230
      @squad.change_weapon(Weapon.heavyflamer, Weapon.assault_cannon)
      @squad.points.should == 205
      @squad.gunny.length == 1
    end

    # it "should the proper weapon and adjust points" do
    #   @squad.add_weapon
    # end

  end
end
