module Fundable
  def add_funds(value=25)
    @amount += value
    "Project #{@name} got more funds!"
  end

  def remove_funds(value=15)
    @amount -= value
    "Project #{@name} lost some funds!"
  end

  def funding_status
    "Project #{@name} has $#{@amount} in funding towards a goal of $#{@goal}."
  end

  def remaining
    @goal -= @amount
  end

  def fully_funded?
    @amount >= @goal
  end
end