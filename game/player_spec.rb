require_relative 'player'

describe Player do

	before do
		$stdout = StringIO.new
		@initial_health = 150
		@player = Player.new("larry", @initial_health)
	end

	it "has a capitalized name" do
		expect(@player.name).to eq("Larry")
	end

	it "has an initial health" do
		expect(@player.health).to eq(150)
	end

	it "has a string representation" do
		expect(@player.to_s).to eq("I'm Larry with a health of 150 and a score of 155.")
	end

	it "computes a score as the sum of it's health and length of a name" do
		expect(@player.score).to eq(@player.health + @player.name.length)
	end

	it "increases health by 15 when w00ted" do
		@player.w00t
		expect(@player.health).to eq(@initial_health + 15)
	end

	it "increases health by 10 when blammed" do
		@player.blam
		expect(@player.health).to eq(@initial_health - 10)
	end

	context "player with a health <= 100" do
		before do
			@player = Player.new("larry", 100)
		end

		it "is wimpy" do
			expect(@player).not_to be_strong
		end
	end

	context "player with a health > 100" do

		before do
			@player = Player.new("larry", 150)
		end

		it "is strong" do
			expect(@player).to be_strong
		end

	end

end