require_relative 'fundable'

class Project
  include Fundable

  attr_accessor :name, :amount
  attr_reader :goal

  def initialize(name, amount=1000, goal=3000)
    @name = name
    @amount = amount
    @goal = goal
    @pledge_list = Hash.new(0)
  end

  def add_pledge(pledge)
    @pledge_list[pledge.level] += pledge.amount
    @amount += pledge.amount
    puts "#{@name} has received a #{pledge.level} pledge worth $#{pledge.amount}."
  end

  def pledge_totals
    @pledge_list.values.reduce(0, :+)
    puts "Project #{@name}'s pledges: #{@pledge_list}"
  end

  def each_pledge
    @pledge_list.each do |level, amount|
      puts "$#{amount} in #{level} pledges"
    end
  end
end