require 'spec_helper'

describe DefaultSquad do


    before(:each) do
      @choas_squad = ChoasMarineSquad.new
      @thousandson_squad = ThousandSonSquad.new
    end


    it "squad should shoot and kill troops from other squad" do
      @choas_squad.shoot(thousandson_squad)
    end

end
