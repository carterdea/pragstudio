require_relative 'project'

describe Project do
  before do
    @initial_funding = 100
    @initial_goal = 300
    @project = Project.new("ABC", @initial_funding,@initial_goal)
  end

  it "tells you the project status" do
    @project.funding_status.should == "Project ABC has $100 in funding towards a goal of $300."
  end

  it "gives you the remaining amount" do
    @project.remaining.should == 200
  end

  it "Amount increases by $25 when it's add_funds'ed" do
    @project.add_funds
    @project.amount.should == 125
  end

  it "Amount decreases by $15 when it's remove_funds'ed" do
    @project.remove_funds
    @project.amount.should == 85
  end


  context do
    before do
      @project = Project.new("ABC")
    end

    it "has a default funding amount" do
      @project.amount.should == 1000
    end

    it "has a default goal" do
      @project.goal.should == 3000
    end

  end
end