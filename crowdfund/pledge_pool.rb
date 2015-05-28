Pledge = Struct.new(:level, :amount)

module PledgePool
  PLEDGES = [
    Pledge.new(:wood, 10),
    Pledge.new(:bronze, 50),
    Pledge.new(:silver, 75),
    Pledge.new(:gold, 100),
    Pledge.new(:platinum, 200),
    Pledge.new(:diamond, 500)
  ]

  def self.random
    PLEDGES.sample
  end
end