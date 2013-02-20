class Weapon

  attr_accessor :range, :strength, :ap, :type, :shots

  def initialize(range, strength, ap, shots, type)
    @range = range
    @strength = strength
    @ap = ap
    @shots = shots
    @type = type
  end
end

#   Types = {

#     lascannon: [48, 8, 2, 'heavy'],
#     boltgun: [24, 4, 5, 'normal'],
#     plasma_gun: [24, 7, 2, 'hot'],
#     krakmissle: [48, 8, 3, 'heavy'],
#     stormbolter: [24, 4, 5, 'rapid_fire'],
#     meltagun: [12, 8, 1, 'hot'],
#     delfgun: [48, 7, 5, 'rapid_fire'],
#     heavybolter: [36, 5, 4, 'rapid_fire'],
#     assault_cannon: [24, 6, 4, 'rapid_fire'],
#     reaper_autocannon: [36, 7, 4, 'rapid_fire'],
#     eldar_reapergun: [36, 7, 4, 'rapid_fire'],
#     infernoboltgun: [24, 4, 3, 'normal']

#   }

#   Types.each do |type, attributes|
#     define_singleton_method type do
#       Weapon.new(*attributes)
#     end
#   end
# end
