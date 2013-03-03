require 'spec_helper'

describe Weapon do

  describe 'getshot' do
    before(:each) do
      @thousandson = ThousandSon.create
      @marine = Marine.create
    end

    it "should force marine to make a armor save when he rolls to hit roll of 1 with a plasmagun that has gets hot rule" do
      $results.clear
      Weapon.plasma_gun.use(@marine, @thousandson, hit: 1)
      $results.length.should == 2
    end

  end
end
