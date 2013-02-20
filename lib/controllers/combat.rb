class Combat

  attr_accessor :defender, :attacker, :attack_rolls, :result, :defend_rolls

  def initialize(attacker, defender, attack_rolls, defend_rolls)
    @attacker = attacker
    @defender = defender
    @attack_rolls = attack_rolls
    @defend_rolls = defend_rolls
    initiative_test
  end

  def initiative_test
    attacker.combat = "combat"
    defender.combat = "combat"

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
    attacker.combat = "" if defender.dead? == true
    defender.combat = "" if attacker.dead? == true
  end
end
