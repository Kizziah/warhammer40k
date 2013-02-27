require 'spec_helper'

describe ThousandSonSquad do

  describe 'squad details, info, and rules according to Codex' do
    before(:each) do
      @squad = ThousandSonSquad.new
    end

    it "should create a basic ThosandSon Squad" do
      @squad.points.should == 150
      @squad.length.should == 5
    end

    it "should add troops and adjust squad's points, 23 points per extra troop" do
      @squad.add_troop(1)
      @squad.points.should == 173
    end

    it "should allow max 15 troops to be added, making 20 total in squad" do
      @squad.add_troop(15)
      @squad.points.should == 495
      @squad.length.should == 20
    end

    it "should allow max 15 troops to be added, making 20 total in squad even if number is larger then 15" do
      @squad.add_troop(600)
      @squad.points.should == 495
      @squad.length.should == 20
    end

  end

end
