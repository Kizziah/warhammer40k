require 'spec_helper'

describe Board do

  describe "width" do
    it "should return the number of tiles wide" do
      board = Board.new(5, 6)
      board.width.should == 5
    end
  end

  describe "height" do
    it "should return the number of tiles wide" do
      board = Board.new(5, 6)
      board.height.should == 6
    end
  end

  describe "tiles" do
    it "should return an array of 2 tiles" do
      board = Board.new(2, 1)
      board.find_tile(1, 1).coordinates.should == [1, 1]
      board.find_tile(2, 1).coordinates.should == [2, 1]
    end

    it "should return an array of 2 tiles by 2 tiles" do
      board = Board.new(2, 2)
      board.find_tile(1, 1).coordinates.should == [1, 1]
      board.find_tile(2, 1).coordinates.should == [2, 1]
      board.find_tile(1, 2).coordinates.should == [1, 2]
      board.find_tile(2, 2).coordinates.should == [2, 2]
    end
  end

  describe "find_tile" do
    it "should return a tile object" do
      board = Board.new(2, 2)
      board.find_tile(2,1).should be_a_kind_of(Tile)
    end

    it "should find the tile with the specified coordinates" do
      board = Board.new(2, 2)
      board.find_tile(2,1).coordinates.should == [2,1]
    end
  end
end
