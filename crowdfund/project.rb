class Project
  attr_accessor :name
  attr_reader :amount, :goal

  def initialize(name, amount=1000, goal=3000)
    @name = name
    @amount = amount
    @goal = goal
  end

  def funding_status
    "Project #{@name} has $#{@amount} in funding towards a goal of $#{@goal}."
  end

  def remaining
    @goal -= @amount
  end

  def add_funds(value=25)
    @amount += value
    "Project #{@name} got more funds!"
  end

  def remove_funds(value=15)
    @amount -= value
    "Project #{@name} lost some funds!"
  end
end