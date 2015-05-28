require_relative 'treasure_trove'
require_relative 'playable'

class Player
  include Playable

  attr_reader :name
  attr_accessor :health, :score

  def initialize(name, health=100)
    @name = name.capitalize
    @health = health
    @treasure_stash = Hash.new(0)
  end

  def name=(new_name)
    @name = new_name.capitalize
  end

  def score
    @score = @name.length + @health
  end

  def find_treasure(treasure)
    @treasure_stash[treasure.name] += treasure.points
    puts "#{@name} found a #{treasure.name} worth #{treasure.points} points."
  end

  def treasure_points_total
    @treasure_stash.values.reduce(0, :+)
  end

  def each_found_treasure
    @treasure_stash.each do |name, points|
      treasure = Treasure.new(name, points)
      yield treasure
    end 
  end

  def <=>(other)
    other.score <=> score
  end

  def self.from_csv(string)
    name, health = string.split(',')
    Player.new(name, Integer(health))
  end

  def to_csv
    puts"#{@name.ljust(25,'.')} #{@health}"
  end

  def to_s
    "I'm #{@name} with a health of #{@health} and a score of #{score}."
  end
end

if __FILE__ == $0
  player = Player.new("moe")
  puts player.name
  puts player.health
  player.w00t
  puts player.health
  player.blam
  puts player.health
end