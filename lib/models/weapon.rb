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

  def use(user, target, shoot_rolls = {})
    user.bs_weapon = self
    self.shots.times { Shot.new(user, target, shoot_rolls) }
  end

  Types = {
    doom_siren: [1, 5, 3, 1, "assualt"]
    twinlinkedlascannon: [48, 9, 2, 1, 'lascannon', 'twinlinked'],
    lascannon: [48, 9, 2, 1, 'lascannon', 'heavy'],
    boltgun: [24, 4, 5, 1, 'boltgun', 'rapidfire'],
    plasmacannon: [36, 7, 2, 1, :plasmacannon, :blast],
    plasma_gun: [24, 7, 2, 1, 'plasma_gun', 'getshot'],
    krakmissle: [48, 8, 3, 1, 'krakmissle', 'heavy'],
    stormbolter: [24, 4, 5, 2, 'stormbolter', 'assault'],
    meltagun: [12, 8, 1, 1, 'meltagun', 'melta' ],
    multimelta: [24, 8, 1, 1, 'multimelta', 'melta', :blast ],
    delfgun: [48, 7, 5, 3, 'delfgun'],
    heavybolter: [36, 5, 4, 3, 'heavybolter'],
    assault_cannon: [24, 6, 4, 4,'assault_cannon', 'rending'],
    autocannon: [48, 7, 4, 2, 'autocannon'],
    reaper_autocannon: [36, 7, 4, 3, 'reaper_autocannon', 'twinlinked'],
    eldar_reapergun: [36, 7, 4, 1, 'eldar_reapergun'],
    infernoboltgun: [24, 4, 3, 1, 'infernoboltgun', 'rapidfire'],
    infernoboltpistol: [12, 4, 3, 1, 'infernoboltgun', 'pistol'],
    boltpistol: [12, 4, 4, 1, 'boltpistol', 'pistol'],
    autopistol: [12, 3, 7, 1, 'autopistol', 'pistol'],
    autogun: [24, 3, 7, 1, 'autogun', 'rapidfire'],
    plasmapistol: [12, 7, 2, 1, 'plasmapistol', 'pistol'],
    powersword: [0, 4, 3, 1, 'powersword'],
    powerfist: [0, 8, 2, 1, 'powerfist', 'unwiedly'],
    poweraxe: [0, 5, 2, 1, 'poweraxe', 'unwiedly'],
    combibolter: [24, 4, 5, 1, 'combibolter', 'twinlinked' ],
    chainsword: [0, 4, 7, 1, 'chainsword', 'melee'],
    chainaxe: [0, 4, 4, 1, 'chainaxe', 'melee'],
    heavyflamer: [1, 5, 4, 1, 'heavyflamer', 'template'],
    knive: [0, 4, 7, 1, 'knive', 'melee']

  }

  Types.each do |type, attributes|
    define_singleton_method type do
      Weapon.new(*attributes)
    end
  end

end
