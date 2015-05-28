module MovieSystem
  VERSION = 1.0

  def self.info
    puts "Movie system version is #{VERSION}"
  end
end

module GameSystem
  VERSION = 2.0

  def self.info
    puts "Game system version is #{VERSION}"
  end

  class Player
  end
end

puts MovieSystem::VERSION
puts MovieSystem::info
puts GameSystem::VERSION
puts GameSystem::info
