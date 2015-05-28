require_relative 'project'
require_relative 'collection'
require_relative 'die'

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
    @project.amount.should == @initial_funding + 25
  end

  it "Amount decreases by $15 when it's remove_funds'ed" do
    @project.remove_funds
    @project.amount.should == @initial_funding - 15
  end

  context do
    before do
      @project = Project.new("ABC", 100,100)
    end

    it "project has raised it's goal" do
      @project.fully_funded?.should == true
    end

  end

  context do
    before do
      @project = Project.new("ABC", 100, 300)
      @kickstarter = Collection.new("Kickstarter")
      @kickstarter.add_project(@project)
      @rounds = 1
    end

    # it "adds funds if an even number is rolled" do     // deprecated due to pledges
    #   Die.any_instance.stub(:roll).and_return(2)
    #   @kickstarter.request_funding(@rounds)
    #   @project.amount.should == @initial_funding + 25
    # end

    # it "removes funds if an odd number is rolled" do
    #   Die.any_instance.stub(:roll).and_return(5)
    #   @kickstarter.request_funding(@rounds)
    #   @project.amount.should == @initial_funding - 15
    # end
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

  before do
    $stdout = StringIO.new
  end
end