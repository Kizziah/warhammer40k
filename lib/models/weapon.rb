class Weapon

  attr_accessor :range, :strength, :ap, :type, :shots

  def initialize(range, strength, ap, shots, type)
    @range = range
    @strength = strength
    @ap = ap
    @shots = shots
    @type = type
  end

  Types = {

    lascannon: [48, 8, 2, 1, 'lascannon'],
    boltgun: [24, 4, 5, 1, 'boltgun'],
    plasma_gun: [24, 7, 2, 1, 'plasma_gun'],
    krakmissle: [48, 8, 3, 1, 'krakmissle'],
    stormbolter: [24, 4, 5, 1, 'stormbolter'],
    meltagun: [12, 8, 1, 1, 'meltagun'],
    delfgun: [48, 7, 5, 3, 'delfgun'],
    heavybolter: [36, 5, 4, 3, 'heavybolter'],
    assault_cannon: [24, 6, 4, 3,'assault_cannon'],
    reaper_autocannon: [36, 7, 4, 3, 'reaper_autocannon'],
    eldar_reapergun: [36, 7, 4, 1, 'eldar_reapergun'],
    infernoboltgun: [24, 4, 3, 1, 'infernoboltgun']

  }

  Types.each do |type, attributes|
    define_singleton_method type do
      Weapon.new(*attributes)
    end
  end

end
