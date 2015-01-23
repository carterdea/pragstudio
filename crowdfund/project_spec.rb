require_relative 'project'

describe Project do
	
	before do
		@initial_funding = 1000
		@project = Project.new("ABC", @initial_funding, 3000)
		@funding = @project.funding
		@goal = @project.goal
	end

	it "has an initial target funding amount" do
		expect(@goal).to eq(3000)
	end

	it "computes the total funding outstanding as a target funding amount minus the funding amount" do
		expect(@project.amt_remaining).to eq(@project.goal - @project.funding)
	end

	it "increases funds by 25 when funds are added" do
		@project.add_funds(25)
		expect(@project.funding).to eq(@initial_funding + 25)
	end

	it "decreases funds by 15 when funds are removed" do
		@project.subtract_funds(15)
		expect(@project.funding).to eq(@initial_funding - 15)
	end

	context "has no defined value" do

		before do
			@project = Project.new("ABC")
		end

		it "has a default value of 0 for funding amount" do
			expect(@project.funding).to eq(0)
		end

	end

end