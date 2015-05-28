require_relative 'die'
require_relative 'project'
require_relative 'funding_round'

require 'csv'

class Collection
  attr_reader :name

  def initialize(title)
    @projects = []
  end

  def add_project(new_project)
    @projects << new_project
  end

  def load_projects(from_file="projects.csv")
    CSV.foreach(from_file) do |row|
      project = Project.new(row[0],row[1].to_i,row[2].to_i)
      add_project(project)
    end
  end

  def request_funding(rounds=3)
    puts "There are #{@projects.size} projects being funded:"
    1.upto(rounds) do |n|
      puts "\nRound #{n}:"
      @projects.each do |p|
        FundingRound.update_funds(p)
      end
    end
    puts "\nFunding Status:"
    @projects.each do |p|
      puts p.funding_status
    end

    @projects.each do |p|
      puts "\n#{p.name}'s pledges:"
      p.each_pledge
    end

    puts "\nThe following projects are fully funded:"
    fully_funded_projects, unfunded_projects = @projects.partition { |p| p.fully_funded? }
    fully_funded_projects.each do |p|
      puts "#{p.name} is fully funded!"
    end

    puts "\nThe following projects still need funding:"
    unfunded_projects.each do |p|
      puts "#{p.name} is still needs more funds ($#{p.remaining})."
    end
  end
end