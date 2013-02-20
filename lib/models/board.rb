class Board

  attr_reader :width, :height, :tiles

  def initialize(width, height)
    @width = width
    @height = height
    @tiles = setup_tiles
  end

  def setup_tiles
    board = []
    height.times do |y|
      row = []
      width.times { |x| row << Tile.new(x: x+1, y: y+1) }
      board << row
    end
    board
  end

  def show_distance(tile1, tile2)
    distance(tile1.x, tile1.y, tile2.x, tile2.y )
  end

  def find_tile(x, y)
    tiles[y-1][x-1]
  end

  def place_troop(troop, x, y)
    troop.coordinates = tiles[x][y].coordinates
    tiles[x][y].occupant = troop
    troop.tile = tiles[x][y]
  end

  def move_south(troop)
    realase_troop_from_the_tile_it_moved_from(troop)
    x = troop.coordinates.last - 1
    y = troop.coordinates.first
    place_troop(troop, x, y)
  end

  def move_north(troop)
    realase_troop_from_the_tile_it_moved_from(troop)
    x = troop.coordinates.last - 1
    y = troop.coordinates.first - 2
    place_troop(troop, x, y)
  end

  def move_east(troop)
    realase_troop_from_the_tile_it_moved_from(troop)
    x = troop.coordinates.last
    y = troop.coordinates.first - 1
    place_troop(troop, x, y)
  end

  def move_west(troop)
    realase_troop_from_the_tile_it_moved_from(troop)
    x = troop.coordinates.last - 2
    y = troop.coordinates.first - 1
    place_troop(troop, x, y)
  end

  def realase_troop_from_the_tile_it_moved_from(troop)
    x = troop.coordinates.first
    y = troop.coordinates.last
    tile = find_tile(x, y)
    tile.occupant = nil
    troop.tile = nil
  end
end
