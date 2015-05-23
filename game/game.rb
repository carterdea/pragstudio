require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'

class Game
  attr_reader :title

  def initialize(title)
    @title = title.capitalize
    @players = []
  end

  treasures = TreasureTrove::TREASURES
  puts "\nThere are #{treasures.size} treasures to be found:"
  treasures.each do |treasure|
    puts "A #{treasure.name} is worth #{treasure.points}"
  end

  def add_player(a_player)
    @players << a_player
  end

  def play(rounds)
    puts "There are #{@players.length} players in this game:"
    1.upto(rounds) do |round|
      puts "\nRound #{round}:"
      @players.each do |player|
        puts player
      end
      @players.each do |player|
        GameTurn.take_turn(player)
        puts player
      end
    end
  end

  def to_s
    puts "This is the #{@title} game."
  end

  def print_name_and_health(player)
    puts "#{player.name} #{player.health}"
  end

  def print_stats
    strong_players, wimpy_players = @players.partition { |p| p.strong? }

    puts "\nStrong:"
    strong_players.each do |p|
      print_name_and_health(p)
    end
    puts "\nWimpy:"
    wimpy_players.each do |p|
      print_name_and_health(p)
    end

    puts "\n#{@title} High Scores:"
    @players.sort.each do |p|
      formatted_name = p.name.ljust(20, '.')
      puts "#{formatted_name} #{p.score}"
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Game.new('bananas')
  puts game.title
end
