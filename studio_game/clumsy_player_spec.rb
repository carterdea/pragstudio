require_relative 'clumsy_player'

describe ClumsyPlayer do
  before do
    @player = ClumsyPlayer.new("klutz")
  end
  
  it "only gets half the point value for each treasure" do
    @player.treasure_points_total.should == 0

    hammer = Treasure.new(:hammer, 50)
    @player.find_treasure(hammer)
    @player.find_treasure(hammer)
    @player.find_treasure(hammer)

    @player.treasure_points_total.should == 75

    crowbar = Treasure.new(:crowbar, 400)
    @player.find_treasure(crowbar)
    
    @player.treasure_points_total.should == 275    
    
    yielded = []
    @player.each_found_treasure do |treasure|
      yielded << treasure
    end

    yielded.should == [Treasure.new(:hammer, 75), Treasure.new(:crowbar, 200)]    

  end

  context "with a boost factor" do
    before do
      @initial_health = 100
      @boost_factor = 5
      @player = ClumsyPlayer.new("klutz", @initial_health, @boost_factor)
    end

    it 'has a boost factor' do
      @player.boost_factor.should == 5
    end

    it "gets boost_factor number of w00ts when w00ted" do
      @player.w00t

      @player.health.should == @initial_health + (15 * @boost_factor)
    end
  end
end