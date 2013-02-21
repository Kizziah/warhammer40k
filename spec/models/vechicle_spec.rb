require 'spec_helper'

describe Vechicle do

    describe 'LandRaider' do
      before(:each) do
      @landraider = LandRaider.new
      @havoc = Havoc.new
      @cultist = Cultist.new
      @board = Board.new(10, 10)
      @board.place_troop(@landraider, 4, 2)
      @board.place_troop(@cultist, 2, 2)
      @board.place_troop(@havoc, 9, 9)

      end

      it "should explode from being shot by lascannon and explosion should kill cultist that is 5 inches away" do
        @havoc.shoot(@landraider, hit: 6, strength: 6, chart: 6 )
        @landraider.wrecked?.should == true
      end
    end
end
