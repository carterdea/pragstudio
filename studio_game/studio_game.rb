def time
  current_time = Time.new
  current_time.strftime("%l:%M:%S")
end

def say_hello(name, health=100)
  "I'm #{name.capitalize} with a health of #{health} as of #{time}."
end

puts say_hello("larry", 60)
puts say_hello("curly", 125)
puts say_hello("moe")
puts say_hello("shemp", 90)

current_time = Time.new
formatted_time = current_time.strftime("%A %m/%d/%Y at %l:%M:%S%p")

puts "The game started on #{formatted_time}"