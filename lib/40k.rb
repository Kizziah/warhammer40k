require 'awesome_print'
require 'pry'

require_relative 'controllers/shoot'
require_relative 'controllers/combat'
require_relative 'controllers/assault'
require_relative 'controllers/squad_actions'
require_relative 'controllers/shoot_helper'
require_relative 'controllers/shoot_vehicle'
require_relative 'controllers/vehicle_explosion'
require_relative 'controllers/gets_hot'

require_relative 'models/troop'

require_relative 'models/troop_types/marine'
require_relative 'models/troop_types/cultist'
require_relative 'models/troop_types/loota'
require_relative 'models/troop_types/terminator'
require_relative 'models/troop_types/terminator'
require_relative 'models/troop_types/nil_troop'

require_relative 'models/vehicles/vehicle'
require_relative 'models/vehicles/landraider'
require_relative 'models/vehicles/rhino'

require_relative 'models/dice'
require_relative 'models/squad'
require_relative 'models/army'
require_relative 'models/weapon'
require_relative 'models/game'
require_relative 'models/tile'
require_relative 'models/board'
require_relative 'models/aresenal'

require_relative 'models/squad_types/ultra_terminator_squad'

require_relative 'game_helpers/point'
require_relative 'game_helpers/board_logic'
require_relative 'game_helpers/create_armies'
require_relative 'game_helpers/misc'

require_relative 'game_phases/movement_phase'
require_relative 'game_phases/shooting_phase'
require_relative 'game_phases/assault_phase'
