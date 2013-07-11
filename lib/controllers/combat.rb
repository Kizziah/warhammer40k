class Combat

  attr_accessor :defender, :attacker, :attack_rolls, :result, :defend_rolls

  def initialize(attacker, defender, attack_rolls, defend_rolls)
    @turn = turn
    @attacker = attacker
    @defender = defender
    @attack_rolls = attack_rolls
    @defend_rolls = defend_rolls
    initiative_test
  end

  def initiative_test
    attacker.combat = true
    defender.combat = true

    if attacker.i > defender.i
      Assault.new(attacker, defender, attack_rolls)
      Assault.new(defender, attacker, defend_rolls) unless defender.dead?
    end

    if attacker.i < defender.i
      Assault.new(defender, attacker, defend_rolls)
      Assault.new(attacker, defender, attack_rolls) unless attacker.dead?
    end

    if attacker.i == defender.i
      Assault.new(attacker, defender, attack_rolls)
      Assault.new(defender, attacker, defend_rolls)
    end
    attacker.combat = nil if defender.dead? == true
    defender.combat = nil if attacker.dead? == true
  end

end
