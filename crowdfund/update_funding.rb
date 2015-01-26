require_relative 'project'
require_relative 'die'

module UpdateFunding
  def self.user_updates(project)
    die = Die.new
    case die.roll
    when 1..2
      project.add_funds(100)
    when 3..4
      puts "#{project.name} was skipped."
    else
      project.subtract_funds(50)
    end
  end

  def self.funding_status(project)
    if project.amt_remaining <= 0
      puts "Project #{project.name} is fully funded!"
    else
      puts "Project #{project.name} needs to raise $#{project.amt_remaining} to reach it's goal."
    end
  end
end
