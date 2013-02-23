def distance(x1, y1, x2, y2)
  # distance = sqrt of ((x2 - x1)2 + ( y2 - y1)2)
  x = (x2 - x1)
  xt = (x * x)
  y = y2 - y1
  yt = (y * y)
  g = yt + xt
  distance = Math.sqrt(g)
  distance.to_i
end

def distance_tile(tile1, tile2)
  distance(tile1.x, tile1.y, tile2.x, tile2.y)
end
