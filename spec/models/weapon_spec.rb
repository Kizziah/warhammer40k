require 'spec_helper'

describe Weapon do

  describe 'rapidfire' do
    before(:each) do
      @thousandson = ThousandSon.create
      @marine = Marine.create
      @board = Board.new(30, 30)
      @board.place_troop(@thousandson, 10, 10)
      @board.place_troop(@marine, 2, 2)
    end

    it "should allow marine to shoot twice because of rapidfire rule when Marine is within 12 inches of target" do
      @marine.shoot(@thousandson)
      $results.length.should == 2
    end

    it "should allow marine to only shoot once after target runs making distance over 12 " do
      $results.clear
      @board.place_troop(@thousandson, 20, 10)
      @marine.shoot(@thousandson)
      $results.length.should == 1
    end
  end


  describe 'getshot' do
    before(:each) do
      @thousandson = ThousandSon.create
      @marine = Marine.create
      @marine.bs_weapon = Weapon.send(:plasma_gun)
      @board = Board.new(30, 30)
      @board.place_troop(@thousandson, 10, 10)
      @board.place_troop(@marine, 2, 2)
    end

    it "should force marine to make a armor save when he rolls to hit roll of 1 with a plasmagun that has gets hot rule" do
      $results.clear
      @marine.shoot(@thousandson, hit: 1 )
      $results.length.should == 2
    end

  end
end
