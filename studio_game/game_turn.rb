require_relative 'player'
require_relative 'die'
require_relative 'loaded_die'
require_relative 'treasure_trove'

module GameTurn
  def self.roll_die
    rand(1..6)
  end

  def self.take_turn(player)
    die = Die.new
    case die.roll
    when 5..6
      player.w00t
    when 1..2
      player.blam
    else
      puts "#{player.name} was skipped."
    end

    random_treasure = TreasureTrove.random
    player.find_treasure(random_treasure)
  end
end
