class PlaylistEntry
	def initialize(path)
		@path = path
		@rating = 0
	end
	
	def path
		@path
	end
	
	def rating
		@rating
	end
	
	def rocks
		@rating = @rating + 1
	end

	def sucks
		@rating = @rating - 1
	end

	def inspect
		"#@path , #@rating"
	end
end
