require 'spec_helper'

describe Troop do

  describe 'shoot' do
    before(:each) do
      @thousandson = ThousandSon.create
      @havoc = Havoc.create
      @ork =  Loota.create
      @marine = Marine.create
      @cultist = Cultist.new
      @board = Board.new(30, 30)
      @board.place_troop(@thousandson, 11, 10)
      @board.place_troop(@marine, 3, 2)
      @board.place_troop(@havoc, 10, 10)
      @board.place_troop(@cultist, 2, 2)
      @board.place_troop(@ork, 3, 7)
    end

    it "should auto kill the marine when a 6 hit, 6 strength, and 3 AP" do
      shot = @thousandson.shoot(@marine, hit: 6, strength: 6, armor: 1)
      @marine.dead?.should == true
    end

    it "should miss the ork when a 1 hit is rolled" do
      shot = @thousandson.shoot(@ork, hit: 1, strength: 6)
      @ork.dead?.should == false
    end

    it "should not kill the ork when a 2 strength is rolled" do
      shot = @thousandson.shoot(@ork, hit: 6, strength: 2)
      @ork.dead?.should == false
    end

    it "should not kill ork because armor save 6 is rolled" do
      @cultist.shoot(@ork, hit: 6, strength: 6, armor: 6)
      @ork.dead?.should == false
    end

    it "should kill marine because armor save 2 is rolled" do
      @cultist.shoot(@marine, hit: 6, strength: 6, armor: 2)
      @marine.dead?.should == true
    end

    it "should not kill the havoc when with 3 armor roll" do
      @ork.shoot(@havoc, hit: 5, strength: 6, armor: 3)
      @havoc.dead?.should == false
    end

    it "should not kill thousandson with a 4 autosave_roll" do
      shot = @ork.shoot(@thousandson, hit: 6, strength: 6, armor: 1, autosave: 4)
      @thousandson.dead?.should == false
    end

    it "should kill thousandson with a 3 autosave_roll" do
      @cultist.shoot(@thousandson, hit: 6, strength: 6, armor: 1, autosave: 1)
      @thousandson.dead?.should == true
    end

    it "should not kill thousandson with a 4 auto_roll and 2 AP" do
      shot = @havoc.shoot(@thousandson, hit: 6, strength: 6, armor: 6, autosave: 4)
      @thousandson.dead?.should == false
    end

    it "should orc should shot 3 times with a delfgun" do
      $results.clear
      @ork.shoot(@marine)
      $results.length.should == 3
    end
  end

  describe 'assault' do
    before(:each) do
      @thousandson = ThousandSon.create
      @orc = Loota.create
      @havoc = Havoc.create
      @cultist = Cultist.new
    end

    it "should thousandson attack first, kills orc, and not get attacked" do
      @thousandson.assault(@orc, hit: 6, strength: 6, armor: 1)
      @orc.dead?.should == true
      @thousandson.dead?.should == false
    end

    it "thousandson attack first, miss orc then get killed by orc" do
      @thousandson.assault(@orc, { hit: 1, }, {hit: 6, strength: 6, armor: 1, autosave: 1})
      @orc.dead?.should == false
      @thousandson.dead?.should == true
    end

    it "thousandson attack first, miss orc then defend 3 attacks from orc" do
      @orc.a.should == 3
      @thousandson.assault(@orc, { hit: 1, }, { hit: 1, strength: 6, armor: 1, autosave: 1 })
      @orc.dead?.should == false
      @thousandson.dead?.should == false
      @orc.a.should == 0
    end

    # it "cultist assaults havoc, havoc attacks first misses then killed by cultist" do
    #   @cultist.assault(@havoc, { hit: 6, strength: 6, armor: 1}, { hit: 1 })
    #   @cultist.dead?.should == false
    #   @havoc.dead?.should == true
    # end

    # it "cultist assaults havoc, havoc attacks first kills cultist" do
    #   @cultist.assault(@havoc, { hit: 6, strength: 6, armor: 1}, {hit: 6, hit: 6, strength: 6, armor: 1})
    #   @cultist.dead?.should == true
    #   @havoc.dead?.should == false
    # end

    it "havoc attacks thousandson both are killed" do
      @havoc.assault(@thousandson, {hit: 6, strength: 6, armor: 1, autosave: 0}, {hit: 6, strength: 6, armor: 1, autosave: 0})
      @havoc.dead?.should == true
      @thousandson.dead?.should == true
    end

    it "havoc attacks thousandson both are saved by armor" do
      @havoc.assault(@thousandson, {hit: 6, strength: 6, armor: 3, autosave: 0}, {hit: 6, strength: 6, armor: 3, autosave: 0})
      @havoc.dead?.should == false
      @thousandson.dead?.should == false
    end

    it "orc attacks havoc, havoc misses, then orc kills havoc with 2nd attack" do
      @orc.assault(@havoc, { hit: 6, strength: 6, armor: 1, autosave: 0 }, { hit: 6, strength: 6, armor: 6, autosave: 0 })
      @havoc.dead?.should == true
      @orc.dead?.should == false
      @orc.a.should == 2
    end

    it "orc attacks havoc, havoc misses, then orc kills havoc with 2nd attack" do
      @orc.assault(@havoc, { hit: 6, strength: 6, armor: 1, autosave: 0 }, { hit: 6, strength: 6, armor: 6, autosave: 0 })
      @havoc.dead?.should == true
      @orc.dead?.should == false
      @orc.a.should == 2
    end

    it "orc attacks havoc, havoc misses, then orc kills havoc with 2nd attack" do
      @orc.assault(@havoc, { hit: 6, strength: 6, armor: 1, autosave: 0 }, { hit: 6, strength: 6, armor: 6, autosave: 0 })
      @havoc.dead?.should == true
      @orc.dead?.should == false
      @orc.a.should == 2
    end
  end

  describe 'move' do
    before(:each) do
      @marine = Marine.create
      @cultist = Cultist.new
    end

    it "should move the distance ordered" do
      # @marine.move
    end
  end
end
