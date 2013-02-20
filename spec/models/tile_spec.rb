require 'spec_helper'

describe Tile do

  describe "coordinates" do
    it "should return an array of x/y coordinates" do
      tile = Tile.new(x: 3, y: 4)
      tile.coordinates.should == [3,4]
    end
  end

  describe "cover" do
    it "should have a cover of 4" do
      tile = Tile.new(x: 3, y: 4, cover: 4)
      tile.cover.should == 4
    end
    it "should default to nil (no cover)" do
      tile = Tile.new(x: 3, y: 4)
      tile.cover.should be_nil
    end
  end

  describe "occupied?" do
    it "should be true if the tile has an occupant" do
      tile = Tile.new(x: 3, y: 4)
      tile.occupant = Troop.new
      tile.should be_occupied
    end
  end
end
