require 'spec_helper'

describe Vehicle do

    describe 'LandRaider' do
      before(:each) do
        @landraider = LandRaider.new
        @havoc = Havoc.create
        @cultist = Cultist.new
        @board = Board.new(10, 10)
        @board.place_troop(@landraider, 4, 2)
        @board.place_troop(@cultist, 2, 2)
        @board.place_troop(@havoc, 9, 9)
        @all_units = @board.all_units
      end

      it "should explode from being shot by lascannon and explosion should kill cultist that is 5 inches away" do
        @havoc.shoot(@landraider, {hit: 6, strength: 6, chart: 6 }, @all_units )
        @landraider.wrecked?.should == true
        # @cultist.dead?.should == true
      end

      it "should be shot twice, both shots destroy a different weapon" do
        @havoc.shoot(@landraider, hit: 6, strength: 6, chart: 3 )
        @havoc.shoot(@landraider, hit: 6, strength: 6, chart: 3 )
        @landraider.wrecked?.should == false
        @landraider.hp.should == 2
      end

      it "should be wrecked by 4 glancing hits" do
        @havoc.shoot(@landraider, hit: 6, strength: 5)
        @havoc.shoot(@landraider, hit: 6, strength: 5)
        @havoc.shoot(@landraider, hit: 6, strength: 5)
        @havoc.shoot(@landraider, hit: 6, strength: 5)
        @landraider.wrecked?.should == true
      end

      it "should explode with a chart roll of 5 because of a lascannons AP bonus" do
        @havoc.shoot(@landraider, {hit: 6, strength: 6, chart: 5 }, @all_units )
        @landraider.wrecked?.should == true
      end

      it "should have no effect if lasscannon shoots hits and rolls a 4 strength roll" do
        @havoc.shoot(@landraider, {hit: 6, strength: 4 }, @all_units )
        @landraider.wrecked?.should == false
        @landraider.hp.should == 4
        @landraider.mobility.should == nil
      end

      it "should be immobmlilised when a 4 is rolled by a lasscannon, because of the AP bonus" do
        @havoc.shoot(@landraider, {hit: 6, strength: 6, chart: 4 } )
        @landraider.wrecked?.should == false
        @landraider.hp.should == 3
        @landraider.mobility.should == false
      end

      it "should crew be stunned when a 2 is rolled" do
        @havoc.shoot(@landraider, {hit: 6, strength: 6, chart: 2 } )
        @landraider.wrecked?.should == false
        @landraider.hp.should == 3
        @landraider.crew.should == 'stunned'
      end

    end

    describe 'Rhino' do
      before(:each) do
        @rhino = Rhino.new
        @havoc = Havoc.create
        @cultist = Cultist.new
        @board = Board.new(10, 10)
        @board.place_troop(@rhino, 4, 2)
        @board.place_troop(@cultist, 2, 2)
        @board.place_troop(@havoc, 9, 9)
        @all_units = @board.all_units
      end

      it "should explode when shoot by lasscannon" do
        @havoc.shoot(@rhino, {hit: 6, strength: 6, chart: 6 }, @all_units )
        @rhino.wrecked?.should == true
      end

      it "should lose mobility and weapon after a second weapon should be destroyed" do
        @havoc.shoot(@rhino, hit: 6, strength: 6, chart: 3 )
        @havoc.shoot(@rhino, hit: 6, strength: 6, chart: 3 )
        @rhino.mobility.should == false
      end
    end
end
