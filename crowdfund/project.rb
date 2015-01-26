class Project
  attr_accessor :name
  attr_reader :funding, :goal

  def initialize(name, funding = 0, goal = 1)
    @name = name
    @funding = funding
    @goal = goal
  end

  def add_funds(amt)
    @funding += amt
    amt.to_s
    puts "Project #{@name} got $#{amt}!"
  end

  def subtract_funds(amt)
    @funding -= amt
    amt.to_s
    puts "Project #{@name} lost $#{amt}!"
  end

  def amt_remaining
    @goal - @funding
  end

  def to_s
    "Project #{@name} has $#{@funding} in funding towards a goal of $#{@goal}."
  end

  def <=>(other)
    other.amt_remaining <=> amt_remaining
  end
end
