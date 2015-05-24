require_relative 'project'
require_relative 'collection'

project1 = Project.new("ABC")
project2 = Project.new("LMN", 500)
project3 = Project.new("XYZ", 25, 75)
project4 = Project.new("DEF", 900,10000)


vcfriendly = Collection.new("VC Friendly Start-up Projects")
vcfriendly.add_project(project1)
vcfriendly.add_project(project2)
vcfriendly.add_project(project3)
vcfriendly.request_funding

# projects = [project1, project2, project3]
# projects.pop
# projects.push(project4)

# projects.each do |p|
#   puts p.funding_status
#   puts p.goal
#   puts p.add_funds(35)
#   puts p.remove_funds(8)
# end