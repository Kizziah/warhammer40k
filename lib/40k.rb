require 'awesome_print'
require 'pry'

require_relative 'controllers/combat'
require_relative 'controllers/assault'
require_relative 'controllers/vehicle_explosion'

require_relative 'controllers/weapon_controller/gets_hot'
require_relative 'controllers/weapon_controller/shot'
require_relative 'controllers/weapon_controller/shoot_vehicle'


require_relative 'models/troop'

require_relative 'models/troop_types/marine'
require_relative 'models/troop_types/cultist'
require_relative 'models/troop_types/loota'
require_relative 'models/troop_types/terminator'
require_relative 'models/troop_types/terminator'
require_relative 'models/troop_types/tank_gunner'
require_relative 'models/troop_types/kharn'
require_relative 'models/troop_types/havoc'

require_relative 'models/vehicles/vehicle'
require_relative 'models/vehicles/landraider'
require_relative 'models/vehicles/rhino'

require_relative 'models/dice'
require_relative 'models/army'
require_relative 'models/weapon'
require_relative 'models/tile'
require_relative 'models/board'


require_relative 'models/squad_types/default_squad'
require_relative 'models/squad_types/ultra_terminator_squad'
require_relative 'models/squad_types/thousand_son_squad'
require_relative 'models/squad_types/havoc_squad'
require_relative 'models/squad_types/choas_marine_squad'

require_relative 'game_helpers/point'
require_relative 'game_helpers/board_logic'
require_relative 'game_helpers/misc'

require_relative 'game_phases/movement_phase'
require_relative 'game_phases/shooting_phase'
require_relative 'game_phases/assault_phase'
