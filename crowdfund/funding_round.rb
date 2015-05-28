require_relative 'project'
require_relative 'die'
require_relative 'pledge_pool'

module FundingRound
  def self.roll_die
    rand(1..6)
  end

  def self.update_funds(project)
    die = Die.new
    case die.roll
    when 2,4,6
      puts project.add_funds
    else
      puts project.remove_funds
    end
    pledge = PledgePool.random
    project.add_pledge(pledge)
    project.pledge_totals
  end
end