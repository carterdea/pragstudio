require_relative 'player'
require_relative 'clumsy_player'
require_relative 'berserk_player'
require_relative 'game'

# player1 = Player.new("moe")
# player2 = Player.new("larry", 60)
# player3 = Player.new("curly", 125)
# player4 = Player.new("shemp", 90)

knuckleheads = Game.new("Knuckleheads")

# knuckleheads.add_player(player1)
# knuckleheads.add_player(player2)
# knuckleheads.add_player(player3)

knuckleheads.load_players(ARGV.shift || "players.csv")
klutz = ClumsyPlayer.new("klutz", 105)
knuckleheads.add_player(klutz)

berserker = BerserkPlayer.new("berserker", 50)
knuckleheads.add_player(berserker)

loop do
  puts "\nHow many rounds do you play? ('quit' to gtfo)"
  answer = gets.chomp.downcase
  case answer
  when /^\d+$/
    knuckleheads.play(answer.to_i)
  when 'quit', 'exit'
    knuckleheads.print_stats
    break
  else
    puts "DOES NOT COMPUTE!!! Enter 'quit' to leave this hell."
  end
end

knuckleheads.save_high_scores