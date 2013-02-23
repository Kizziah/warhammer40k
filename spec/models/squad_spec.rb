require 'spec_helper'

describe Squad do

  describe "attributes" do
    before(:each) do
      @squad = Squad.new('marine', 'good', 1, Marine.new, 6)
      @squad.add_leader(MarineSergeant.new)
    end

    it "should have a name, faction, and option that is an integer " do
      @squad.name
      @squad.faction
      @squad.option.class.should == Fixnum
    end

    it "should fail break test with roll of 12" do
      @squad.break_test(roll: 12)
      @squad.broken?.should == true
    end

    it "should pass the test on Squad Leaders Initiative of 9" do
      @squad.break_test(roll: 9)
      @squad.broken?.should == false
    end

    it "should fail the test with 9 roll after Squad Leader is killed" do
      @squad.leader.w = 0
      @squad.leader.dead?.should == true
      @squad.break_test(roll: 9)
      @squad.broken?.should == true
    end
  end
end
