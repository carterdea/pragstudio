require_relative 'player'
require_relative 'game'

knuckleheads = Game.new('knuckleheads')

player1 = Player.new('moe')
player2 = Player.new('larry')
player3 = Player.new('curly')
# player4 = Player.new("shemp")
# player5 = Player.new("alvin", 100)
# player6 = Player.new("simon", 60)
# player7 = Player.new("theodore", 125)

knuckleheads.add_player(player1)
knuckleheads.add_player(player2)
knuckleheads.add_player(player3)
# knuckleheads.add_player(player4)

knuckleheads.play(3)

knuckleheads.print_stats

# chipmunks = Game.new("chipmunks")

# chipmunks.add_player(player5)
# chipmunks.add_player(player6)
# chipmunks.add_player(player7)

# chipmunks.play
