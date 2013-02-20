class Army < Array

  attr_accessor :squads

  attr_reader :type

  def initialize(type)
    @type = type
    @squads = squads
  end

  def drop_wiped_squads
    self.delete_if {|squad| squad.wiped? }
  end

  def wiped?
    self.length == 0
  end

end
