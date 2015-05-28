class Die
  attr_reader :roll

  def initialize
    roll
  end

  def roll
    rand(1..6)
  end
end