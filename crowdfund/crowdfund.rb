require_relative 'project'
require_relative 'collection'

project1 = Project.new("ABC")
project2 = Project.new("LMN", 500)
project3 = Project.new("XYZ", 55, 75)
project4 = Project.new("DEF", 900,1000)


vcfriendly = Collection.new("VC Friendly Start-up Projects")
# vcfriendly.add_project(project1)
# vcfriendly.add_project(project2)
# vcfriendly.add_project(project3)
# vcfriendly.add_project(project4)

vcfriendly.load_projects

loop do
  puts "How many rounds of funding would you like? Type 'quit' to leave :("
  answer = gets.downcase.chop
  case answer
  when /^\d+$/
    vcfriendly.request_funding(answer.to_i)
  when 'quit', 'exit'
    puts "Thanks for funding! Bye now!"
    break
  else
    puts "Huh? If you wanna leave just type 'quit'"
  end
end