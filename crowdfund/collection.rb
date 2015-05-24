require_relative 'project'

class Collection
  attr_reader :name

  def initialize(title)
    @projects = []
  end

  def add_project(new_project)
    @projects << new_project
  end

  def request_funding
    puts "There are #{@projects.size} projects being funded:"
    @projects.each do |p|
      puts p.funding_status
    end
    @projects.each do |p|
      puts p.add_funds(35)
      puts p.remove_funds(8)
    end
    @projects.each do |p|
      puts p.funding_status
    end
  end
end