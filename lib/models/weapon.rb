class Weapon

  attr_accessor :range, :strength, :ap, :type, :shots, :special, :points

  def initialize(range, strength, ap, shots, type, special = {})
    @range = range
    @strength = strength
    @ap = ap
    @shots = shots
    @type = type
    @special = special
  end

  Types = {

    lascannon: [48, 9, 2, 1, 'lascannon', 'heavy'],
    boltgun: [24, 4, 5, 1, 'boltgun', 'rapidfire'],
    plasma_gun: [24, 7, 2, 1, 'plasma_gun', 'getshot'],
    krakmissle: [48, 8, 3, 1, 'krakmissle', 'heavy'],
    stormbolter: [24, 4, 5, 1, 'stormbolter', 'assault'],
    meltagun: [12, 8, 1, 1, 'meltagun', 'melta' ],
    delfgun: [48, 7, 5, 3, 'delfgun'],
    heavybolter: [36, 5, 4, 3, 'heavybolter'],
    assault_cannon: [24, 6, 4, 3,'assault_cannon'],
    reaper_autocannon: [36, 7, 4, 3, 'reaper_autocannon'],
    eldar_reapergun: [36, 7, 4, 1, 'eldar_reapergun'],
    infernoboltgun: [24, 4, 3, 1, 'infernoboltgun', 'rapidfire'],
    boltpistol: [12, 12, 4, 5, 'boltpistol', 'pistol'],
    autopistol: [16, 3, 7, 1, 'autopistol', 'pistol'],
    powersword: [0, 4, 3, 1, 'powersword'],
    powerfirst: [0, 8, 2, 1, 'powerfirst', 'unwiedly'],
    poweraxe: [0, 5, 2, 1, 'poweraxe', 'unwiedly'],
    combibolter: [24, 4, 5, 1, 'combibolter', 'twinlinked' ]

  }

  Types.each do |type, attributes|
    define_singleton_method type do
      Weapon.new(*attributes)
    end
  end

end
