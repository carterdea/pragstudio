Pledge = Struct.new(:name, :amount)

module PledgePool
  PLEDGES = [
    Pledge.new(:bronze, 50),
    Pledge.new(:silver, 75),
    Pledge.new(:gold, 100)
  ]

  def self.random
    PLEDGES.sample
  end

end

if __FILE__ == $0
  puts PledgePool::PLEDGES
  pledge = PledgePool.random

  puts "A #{pledge.name} is worth $#{pledge.amount}"
end