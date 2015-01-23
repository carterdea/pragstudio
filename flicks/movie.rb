class Movie

	attr_reader :rank
	attr_accessor :title

	def initialize(title, rank=0)
		@title = title.capitalize
		@rank = rank
	end

	def normalized_rank
		@rank / 10
	end

	def thumbs_up
		@rank += 1
	end

	def thumbs_down
		@rank -= 1
	end

	def to_s
		"#{@title} has a rank of #{rank} (#{status})"
	end

	def hit?
		@rank >= 10
	end

	def status
		hit? ? "Hit" : "Flop"
	end

end

if __FILE__ == $0
	movie = Movie.new("Goonies")
	puts movie.title
end