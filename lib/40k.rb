require 'awesome_print'
require 'pry'

require_relative 'controllers/shoot'
require_relative 'controllers/combat'
require_relative 'controllers/assault'
require_relative 'controllers/squad_actions'
require_relative 'controllers/shoot_helper'
require_relative 'controllers/shoot_vechicle'

require_relative 'models/troop'

require_relative 'models/troop_types/marine'
require_relative 'models/troop_types/cultist'
require_relative 'models/troop_types/loota'
require_relative 'models/troop_types/terminator'

require_relative 'models/vechicles/vechicle'
require_relative 'models/vechicles/landraider'

require_relative 'models/dice'
require_relative 'models/squad'
require_relative 'models/army'
require_relative 'models/weapon'
require_relative 'models/game'
require_relative 'models/tile'
require_relative 'models/board'
require_relative 'models/blast_area'

require_relative 'game_helpers/point'
require_relative 'game_helpers/board_logic'
require_relative 'game_helpers/create_armies'

require_relative 'game_phases/movement_phase'
require_relative 'game_phases/shooting_phase'
require_relative 'game_phases/assault_phase'
