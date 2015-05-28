require_relative 'player'

class ClumsyPlayer < Player

  attr_reader :boost_factor

  def initialize(name, health=100, boost_factor=1)
    super(name, health)
    @boost_factor = boost_factor
  end

  def find_treasure(treasure)
    damaged_treasure = Treasure.new(treasure.name, treasure.points / 2.0)
    super(damaged_treasure)
  end

  def w00t
    @boost_factor.times { super }
  end

end

if __FILE__ == $0
  clumsy = ClumsyPlayer.new("klutz", 105, 3)  
  
  hammer = Treasure.new(:hammer, 50)
  clumsy.find_treasure(hammer)
  clumsy.find_treasure(hammer)
  clumsy.find_treasure(hammer)
  
  crowbar = Treasure.new(:crowbar, 400)
  clumsy.find_treasure(crowbar)
  
  clumsy.each_found_treasure do |treasure|
    puts "#{treasure.points} total #{treasure.name} points"
  end
  puts "#{clumsy.treasure_points_total} grand total points"
end