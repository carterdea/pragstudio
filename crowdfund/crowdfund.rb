require_relative 'project'
require_relative 'collection'
require_relative 'die'
require_relative 'update_funding'

project1 = Project.new('ABC', 1000, 3000)
project2 = Project.new('LMN', 2000, 4000)
project3 = Project.new('XYZ', 30, 90)
project4 = Project.new('DEF')

projects = [project1, project2, project3]

# puts project1
# puts project1.add_funds(20)
# puts project1
# puts project1.subtract_funds(50)
# puts project1

# puts "Project #{project1.name} needs to raise $#{project1.amt_remaining} to reach it's goal."

puts "There are #{projects.length} projects on Crowdfunder:"

projects.each do |project|
  UpdateFunding.user_updates(project)

  UpdateFunding.funding_status(project)
end

projects.pop
puts projects

projects.push(project4)
# projects.each do |p|
#   puts p.name
# end

collection = Collection.new('vc-friendly')

collection.add_project(project1)
collection.add_project(project2)
collection.add_project(project3)

puts collection.request_funding
