require_relative 'player'
require_relative 'treasure_trove'

describe Player do
  before do
    @initial_health = 150
    @player = Player.new("moe", @initial_health)
  end

  it "has capitalized name" do
    @player.name.should == "Moe"
  end

  it "has an initial score" do
    @player.health.should == 150
  end

  it "Increases 15 health when it's w00ted" do
    @player.w00t
    @player.health.should == @initial_health + 15
  end

  it "Decreases 10 health when it's blammed" do
    @player.blam
    @player.health.should == @initial_health - 10
  end

  it "computes points as the sum of all treasure points" do
    @player.treasure_points_total.should == 0

    @player.find_treasure(Treasure.new(:hammer, 50))

    @player.treasure_points_total.should == 50

    @player.find_treasure(Treasure.new(:crowbar, 400))

    @player.treasure_points_total.should == 450

    @player.find_treasure(Treasure.new(:hammer, 50))

    @player.treasure_points_total.should == 500
  end

  it "yields each found treasure and its total points" do
    @player.find_treasure(Treasure.new(:skillet, 100))
    @player.find_treasure(Treasure.new(:skillet, 100))
    @player.find_treasure(Treasure.new(:hammer, 50))
    @player.find_treasure(Treasure.new(:bottle, 5))
    @player.find_treasure(Treasure.new(:bottle, 5))
    @player.find_treasure(Treasure.new(:bottle, 5))
    @player.find_treasure(Treasure.new(:bottle, 5))
    @player.find_treasure(Treasure.new(:bottle, 5))

    yielded = []
    @player.each_found_treasure do |treasure|
      yielded << treasure
    end

    yielded.should == [
      Treasure.new(:skillet, 200),
      Treasure.new(:hammer, 50),
      Treasure.new(:bottle, 25)
    ]
  end

  context "with a health greater than 100" do
    before do
      @player = Player.new("moe", 150)
    end

    it "is strong" do
      @player.strong?.should == true
    end
  end

  context "with a health with 100 or less" do
    before do
      @player = Player.new("moe", 100)
    end

    it "is wimpy" do
      @player.strong?.should_not == true
    end
  end

  context "created with default health" do
    before do
      @player = Player.new("moe")
    end

    it "has a default health" do 
      @player.health == 100
    end
  end

  context "in a collection of players" do
    before do
      @player1 = Player.new("moe", 100)
      @player2 = Player.new("larry", 200)
      @player3 = Player.new("curley", 300)

      @players = [@player1, @player2, @player3]
    end

    it "is sorted by decreasing score" do
      @players.sort.should == [@player3, @player2, @player1]
    end
  end

  before do
    $stdout = StringIO.new
  end
end