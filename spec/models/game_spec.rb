require 'spec_helper'

describe Game do

  describe 'attributes of Game' do
    before(:each) do
      @game = Game.new
      @board = @game.board
      @choas_squads = @game.choas_squads
      @marine_squads = @game.marine_squads
    end

    # it "should have choas squads and marine squads" do
    #   @choas_squads
    #   @marine_squads
    # end

    # it "squads should be proper faction" do
    #   @choas_squads.each { |choas| choas.faction.should == 'choas' }
    #   @marine_squads.each { |marine| marine.faction.should == 'marine' }
    # end

  end
end
