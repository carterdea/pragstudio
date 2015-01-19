greeting = "Welcome!"
3.times do
	puts greeting.upcase
end
puts Time.new

name1 = "larry"
name2 = "curly"
name3 = "moe"
name4 = "shremp"
health1 = 60
health2 = 125
health3 = 100
health4 = 90

health_check 

puts "#{name1.capitalize}'s health is #{health1}"
puts "#{name2.upcase}'s health is #{health2}"
puts "#{name3.capitalize}'s health is #{health3}".center(50,"*")
puts "#{name4.capitalize.ljust(40, '.')} #{health4} health"

puts "Players:\n\t#{name1}\n\t#{name2}\n\t#{name3}"

health2 = health1
puts "#{name2.upcase}'s health is #{health2}"

health1 = 30
puts "#{name1.capitalize}'s health is #{health1}"
puts "#{name2.upcase}'s health is #{health2}"