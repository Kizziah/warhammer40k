class Tile

  attr_reader :type

  attr_accessor :cover, :occupant, :x, :y

  def initialize(attributes)
    @x = attributes[:x]
    @y = attributes[:y]
    @cover = attributes[:cover]
    @occupant = occupant
  end

  def coordinates
    [x, y]
  end

  def occupied?
    !occupant.nil?
  end
end
