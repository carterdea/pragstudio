require_relative 'movie'

module Flicks
  class Movie3d < Movie

    def initialize(title, rank, wow_factor)
      super(title, rank)
      @wow_factor = wow_factor
    end

    def thumbs_up
      @wow_factor.times { super }
    end

    def show_effect
      puts "Wow! " * @wow_factor
    end
  end


  if __FILE__ == $0
    movie3d = Movie3d.new('glee', 5, 20)
    puts movie3d.title
    puts movie3d.rank

    puts movie3d.thumbs_up
    puts movie3d

    movie3d.show_effect
  end
end
