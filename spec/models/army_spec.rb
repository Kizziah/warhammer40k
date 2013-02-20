require 'spec_helper'

describe Army do

  describe "create_squads" do
    it "should create squads with proper type" do
      choas_army = Army.new('choas')
      marine_army = Army.new('marine')
      marine_army.type.should == 'marine'
      choas_army.type.should == 'choas'
    end
  end
end
