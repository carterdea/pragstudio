require_relative 'player'

describe Player do
  before do
    $stdout = StringIO.new
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

  context "created with default health" do
    before do
      @player = Player.new("moe")
    end

    it "has a default health" do 
      @player.health == 100
    end
  end
end