require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'
require 'csv'

class Game
  attr_reader :title

  def initialize(title)
    @title = title.capitalize
    @players = []
  end

  def add_player(new_player)
    @players << new_player
  end

  def total_points
    @players.reduce(0) { |sum, player| sum + player.points}
  end

  def high_score_entry(player)
    "#{player.name.ljust(20,'.')} #{player.score}"
  end

  def play(rounds=3)
    treasures = TreasureTrove::TREASURES
    puts "There are #{treasures.size} treasures to be found:"
    treasures.each do |t|
      puts "A #{t.name} is worth #{t.points}"
    end

    puts "\nThere are #{@players.size} players in #{title}:"

    @players.each do |p|
      puts p
    end
    1.upto(rounds) do |number|
      puts "\nRound #{number}:"
      @players.each do |p|
        GameTurn.take_turn(p)
        puts p
      end
    end
  end

  def print_name_and_health(player)
    puts "#{player.name} (#{player.health})"
  end

  def print_stats
    puts "\n#{@title} Statistics:"
    strong_players, wimpy_players = @players.partition { |p| p.strong? } 
    puts "\n#{strong_players.size} strong players:\n"
    strong_players.sort.each do |p|
      print_name_and_health(p)
    end
    puts "\n#{wimpy_players.size} wimpy players:\n"
    wimpy_players.sort.each do |p|
      print_name_and_health(p)
    end

    puts "\n#{@title} High Scores:"
    @players.sort.each do |p|
      puts high_score_entry(p)
    end

    @players.sort.each do |p|
      puts "\n#{p.name}'s point totals:\n"
      p.each_found_treasure do |t|
        puts "#{t.points} total #{t.name} points"
      end
      puts "#{p.treasure_points_total} grand total points"
    end
  end

  def load_players(from_file)
    CSV.foreach(from_file) do |row|
      player = Player.new(row[0],row[1].to_i)
      add_player(player)
    end
  end

  def save_high_scores(to_file="high_scores.txt")
    File.open(to_file, "w") do |file|
      file.puts "#{@title} High Scores:"
      @players.sort.each do |p|
        file.puts high_score_entry(p)
      end
    end
  end
end
