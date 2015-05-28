def conversation
  puts "Hello"
  yield
  puts "Goodbye"
end

def n_times(n=5)
  1.upto(n) do |n|
    yield n
  end
end

conversation { puts "Good to meet you"}

n_times(99999) do |n|
  puts "#{n} situps"
  puts "#{n} pushups"
  puts "#{n} chinups"
end