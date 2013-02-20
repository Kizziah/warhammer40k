require 'spec_helper'

describe Squad do

  describe "attributes" do
    before(:each) do
      @squad = Squad.new('havoc', 'choas', 1)
    end

    it "should have a name, faction, and option that is an integer " do
      @squad.name
      @squad.faction
      @squad.option.class.should == Fixnum
    end
  end
end
